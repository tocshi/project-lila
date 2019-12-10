var user = argument0;
var itemid = argument1;

if(hasBuff(user,"Potion Sickness")){return false;}

var stacks = 0;
for (var i = 0; i < ds_list_size(user.buff); ++i;){
	var buff_array = ds_list_find_value(user.buff,i);
	if(buff_array[2] == "Saturated"){
		stacks = buff_array[5];
		break;
	}
}

switch(itemid){

	// Small Health Potion
	case 1:
		user.statmap[? "hp"] += user.statmap[? "maxhp"]*0.25*(1/power(2,stacks));
		break;

	// Medium Health Potion
	case 2:
		user.statmap[? "hp"] += user.statmap[? "maxhp"]*0.5*(1/power(2,stacks));
		break;

	// Large Health Potion
	case 3:
		user.statmap[? "hp"] += user.statmap[? "maxhp"]*0.75*(1/power(2,stacks));
		break;
	
	default:
		return false;
}
if(stacks >= 4){
	removeBuff(user,"Saturated",true);
	applyBuff(user,60*room_speed,true,"Potion Sickness",buff_saturated,true,1,1,spr_buff_potion_sickness,
		"Your chugged too many potions too quickly! You are now unable to drink potions for a while.",0);
}
else{
	applyBuff(user,15*room_speed,true,"Saturated",buff_saturated,true,1,4,spr_buff_saturated,
		"Drinking that potion didn't feel very good. Significantly reduces the effectiveness of subsequent potions for a short time.",0);
}

return true;