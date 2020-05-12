event_inherited();
if(global.pause){exit;}

// Use Skill
switch(useSkill){
	case "NAME":
	statmap[? "mp"] -= get_skill_data(useSkill,"mpcost");
	cd[findArrayIndex(skills,useSkill)+1] = get_skill_data(useSkill,"cd")*room_speed;
	break;
	
	case "NAME2":
	statmap[? "mp"] -= get_skill_data(useSkill,"mpcost");
	cd[findArrayIndex(skills,useSkill)+1] = get_skill_data(useSkill,"cd")*room_speed;
	break;
	
	case "NAME3":
	statmap[? "mp"] -= get_skill_data(useSkill,"mpcost");
	cd[findArrayIndex(skills,useSkill)+1] = get_skill_data(useSkill,"cd")*room_speed;
	break;
	
	case "NAME4":
	statmap[? "mp"] -= get_skill_data(useSkill,"mpcost");
	cd[findArrayIndex(skills,useSkill)+1] = get_skill_data(useSkill,"cd")*room_speed;
	break;
	
	case "NAME5":
	statmap[? "mp"] -= get_skill_data(useSkill,"mpcost");
	cd[findArrayIndex(skills,useSkill)+1] = get_skill_data(useSkill,"cd")*room_speed;
	break;
	
	case "NAME6":
	statmap[? "mp"] -= get_skill_data(useSkill,"mpcost");
	cd[findArrayIndex(skills,useSkill)+1] = get_skill_data(useSkill,"cd")*room_speed;
	break;
	
	case "NAME7":
	statmap[? "mp"] -= get_skill_data(useSkill,"mpcost");
	cd[findArrayIndex(skills,useSkill)+1] = get_skill_data(useSkill,"cd")*room_speed;
	break;
	
	case "NAME8":
	statmap[? "mp"] -= get_skill_data(useSkill,"mpcost");
	cd[findArrayIndex(skills,useSkill)+1] = get_skill_data(useSkill,"cd")*room_speed;
	break;
	
	case "NAME9":
	statmap[? "mp"] -= get_skill_data(useSkill,"mpcost");
	cd[findArrayIndex(skills,useSkill)+1] = get_skill_data(useSkill,"cd")*room_speed;
	break;
	
	case "NAME0":
	statmap[? "mp"] -= get_skill_data(useSkill,"mpcost");
	cd[findArrayIndex(skills,useSkill)+1] = get_skill_data(useSkill,"cd")*room_speed;
	break;

	default:
	break;
}

// use passive skills
if(isBlocking && cd[findArrayIndex(skills,"Greater Shielding")+1] <= 0){
	applyBuff(self.id,99*room_speed,true,"Knight's Shield: Enhanced",buff_generic,false,-1,0,spr_buff_knights_shield_plus,"Lorem Ipsum",0);
}
