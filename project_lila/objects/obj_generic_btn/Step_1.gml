// Specializations 
switch(type){
	case "Skill Unlock":
	function = call_list(call(unlock_skill, global.skill_unlock_button));
	text = "Unlock - " + string(get_skill_data(global.skill_unlock_button,"cppcost"));
	break;
}