sprite_index = spr_debug_sword;
dir = point_direction(x,y,mouse_x,mouse_y);
skill = room_speed/atkmap[? "atkspeed"];
switch(iter0 % 2){
	case 0:
	image_angle = dir-(angle/2);
	break;
	
	case 1:
	image_angle = dir+(angle/2);
	break;
}