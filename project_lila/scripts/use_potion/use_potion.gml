var user = argument0;
var itemid = argument1;

if(hasBuff(user,"Potion Sickness")){return false;}

var stacks = 0;
if(hasBuff(user,"Saturated")){stacks+=get_buff_data(user,"Saturated","stacks");}
switch(itemid){

	// Small Health Potion
	case 1:
		user.statmap[? "hp"] += user.statmap[? "maxhp"]*0.25;
		stacks += 3;
		break;

	// Medium Health Potion
	case 2:
		user.statmap[? "hp"] += user.statmap[? "maxhp"]*0.5;
		stacks += 5;
		break;

	// Large Health Potion
	case 3:
		user.statmap[? "hp"] += user.statmap[? "maxhp"]*0.75;
		stacks += 7;
		break;
	
	default:
		return false;
}
if(stacks > 9){
	removeBuff(user,"Saturated",true);
	applyBuff(user,60*room_speed,true,"Potion Sickness",buff_saturated,true,1,1,spr_buff_potion_sickness,
		"Your chugged too many potions too quickly! You are now unable to drink potions for a while.",0);
}
else{
	removeBuff(user,"Saturated",true);
	applyBuff(user,15*room_speed,true,"Saturated",buff_saturated,true,stacks,9,spr_buff_saturated,
		"Drinking that potion didn't feel very good. Be careful not to drink too many potions! Becomes Potion Sickness at 10 stacks.",0);
}

return true;