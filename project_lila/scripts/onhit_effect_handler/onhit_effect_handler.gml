var user = argument0;
var target = argument1;

if(!instance_exists(target) || !instance_exists(user)){exit;}

// Handle class buffs
switch(user.statmap[? "class"]){
	case "Archer":
	if(user.statmap[? "classlvl"] >= 7){
		if(atkmap[? "isCrit"]){
			user.statmap[? "mp"] += 5;
		}
	}
	break;
	
	default:
		break;
}

// Handle individual buffs
if(hasBuff(user,"Vicious Venom") && atkmap[? "isBasicAttack"]){
	applyBuff(target,6*room_speed,true,"Poisoned",buff_generic,false,1,10,spr_buff_burning,"You're poisoned!",floor(atkmap[? "atk"]*0.05));
}