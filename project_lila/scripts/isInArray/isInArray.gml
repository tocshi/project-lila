var array = argument0;
var value = argument1;

if(!is_array(array)){show_debug_message("inInArray error: Not an Array!"); return false;}

for(var i; i < array_length_1d(array); i++){
	if(array[i] = value){
		return true;
	}
}
return false;