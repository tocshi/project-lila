var user = argument0;
var target = argument1;

if(!instance_exists(target) || !instance_exists(user)){exit;}

// Handle class buffs
switch(user.statmap[? "class"]){
	case "Archer":
	if(isInArray(user.skills,"Unyielding Arrows")){
		if(atkmap[? "isCrit"]){
			user.statmap[? "mp"] += 5;
		}
	}
	break;
	
	case "Rogue":
	if(isInArray(user.skills,"Vitality Thief") && user.cd[findArrayIndex(user.skills,"Vitality Thief")+1] <= 0){
		if(user.v_thief_target == target){
			user.v_thief_count++;
		}
		else{
			user.v_thief_target = target;
			user.v_thief_count = 1;
		}
	}
	break;
	
	default:
		break;
}

// Handle individual buffs
if(hasBuff(user,"Vicious Venom") && atkmap[? "isBasicAttack"]){
	applyBuff(target,6*room_speed,true,"Poisoned",buff_generic,false,1,10,spr_buff_burning,"You're poisoned!",floor(user.basestatmap[? "atk"]*0.05));
	if(target.statmap[? "hp"] >= target.statmap[? "maxhp"]*0.9 && isInArray(user.skills,"Punish the Strong")){
		applyBuff(user,10*room_speed,true,"Punish the Strong",buff_generic,false,1,1,spr_buff_TODO,"Lorem Ipsum",0);
	}
}