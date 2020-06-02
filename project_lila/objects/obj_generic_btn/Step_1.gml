// Specializations 
switch(type){
	case "Skill Unlock":
	function = create_function_pointer_list(create_function_pointer(unlock_skill, global.skill_unlock_button));
	text = "Unlock - " + string(get_skill_data(global.skill_unlock_button,"cppcost"));
	break;
}