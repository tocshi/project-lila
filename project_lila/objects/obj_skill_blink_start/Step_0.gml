image_angle += 1;
skill--;
if(skill <= 0){
	if(user.cd[findArrayIndex(user.skills,"Spatial Leap")+1] <= 0){
		user.cd[findArrayIndex(user.skills,"Spatial Leap")+1] = get_skill_data("Spatial Leap","cd")*room_speed;
		set_skill_data("Spatial Leap","sprmap",6);
		}
	instance_destroy();
}
