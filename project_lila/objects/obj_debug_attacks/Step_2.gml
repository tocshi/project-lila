if (skill_index != -1){
	switch(skill_index){
		case 0:
			angle = 160
			skill_index = -1;
			sprite_index = spr_debug_sword;
			dir = point_direction(x,y,mouse_x,mouse_y);
			image_angle = dir+(angle/2);
			skill0 = room_speed/atkspeed;
			break;
	}
}