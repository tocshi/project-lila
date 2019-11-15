// Applies a buff to the target's buff list with the following arguments:
var target			= argument0;
var time			= argument1;
var isVisible		= argument2;
var name			= argument3;
var countdownEvent	= argument4;
var isUnremovable	= argument5;
var stacks			= argument6;
var maxStacks		= argument7;
var sprite			= argument8;
var desc			= argument9;

// Creates the buff array to add
var buff_array = array_create(9,false);

// Checks if an existing buff of the same name exists, and if it does
// it will do the following actions:
for (var i = 0; i < ds_list_size(target.buff); i++;){

	var e_buff_array = ds_list_find_value(target.buff,i);
	if((e_buff_array[2] == name)){
		
		// if the buff is unstackable, and the duration of the existing buff is
		// longer than the new buff, then return false and exit the script.
		// Otherwise, increase the stacks of the buff (if below max)
		if(e_buff_array[5] == -1){
			if(e_buff_array[0] >= time){return false;}
		} else {
			if((e_buff_array[5] + stacks) <= e_buff_array[6]){
			stacks += e_buff_array[5];	
			} else {
				stacks = e_buff_array[6];
			}
		}
		
		// if the existing buff's time is longer than the new buff's time, keep
		// the existing value;
		if(e_buff_array[0] > time){
			time = e_buff_array[0];
		}
		removeBuff(target,name);
	}
}


buff_array[0] = time;
buff_array[1] = isVisible;
buff_array[2] = name;
buff_array[3] = countdownEvent;
buff_array[4] = isUnremovable;
buff_array[5] = stacks;
buff_array[6] = maxStacks;
buff_array[7] = sprite;
buff_array[8] = desc;
ds_list_add(target.buff,buff_array);

target.statChange = true;

return true;