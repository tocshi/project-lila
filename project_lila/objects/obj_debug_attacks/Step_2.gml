if (skill_index != -1){
	switch(skill_index){
		case 0:
			angle = 160;
			skill_index = -1;
			sprite_index = spr_debug_sword;
			dir = point_direction(x,y,mouse_x,mouse_y);
			switch(iter0 % 2){
				case 0:
				image_angle = dir-(angle/2);
				break;
				
				case 1:
				image_angle = dir+(angle/2);
				break;
			}
			skill[0] = room_speed/atkspeed;
			break;
		case 1:
			instance_destroy();
			break;
		case 6:
			skill_index = -1;
			alarm[6] = room_speed;
			skill[6] = room_speed*6;
			break;
	}		
}