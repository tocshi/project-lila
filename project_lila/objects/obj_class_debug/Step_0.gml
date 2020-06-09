event_inherited();
if(global.pause){exit;}

// Use Skill
switch(useSkill){
	case "NAME":
	use_skill_mp(useSkill,"")
	set_skill_cd(useSkill,"");
	break;
	
	case "NAME2":
	use_skill_mp(useSkill,"")
	set_skill_cd(useSkill,"");
	break;
	
	case "NAME3":
	use_skill_mp(useSkill,"")
	set_skill_cd(useSkill,"");
	break;
	
	case "NAME4":
	use_skill_mp(useSkill,"")
	set_skill_cd(useSkill,"");
	break;
	
	case "NAME5":
	use_skill_mp(useSkill,"")
	set_skill_cd(useSkill,"");
	break;
	
	case "NAME6":
	use_skill_mp(useSkill,"")
	set_skill_cd(useSkill,"");
	break;
	
	case "NAME7":
	use_skill_mp(useSkill,"")
	set_skill_cd(useSkill,"");
	break;
	
	case "NAME8":
	use_skill_mp(useSkill,"")
	set_skill_cd(useSkill,"");
	break;
	
	case "NAME9":
	use_skill_mp(useSkill,"")
	set_skill_cd(useSkill,"");
	break;
	
	case "NAME0":
	use_skill_mp(useSkill,"")
	set_skill_cd(useSkill,"");
	break;

	default:
	break;
}

// use passive skills
if(isBlocking && cd[findArrayIndex(skills,"Greater Shielding")+1] <= 0){
	applyBuff(self.id,99*room_speed,true,"Knight's Shield: Enhanced",buff_generic,false,-1,0,spr_buff_knights_shield_plus,"Lorem Ipsum",0);
}
