event_inherited();

image_alpha = 0;
mask_index = spr_empty;
direction = point_direction(obj_player.x,obj_player.y,mouse_x,mouse_y);
image_angle = direction;

alarm[0] = room_speed/2;
active = false;
skill = room_speed*10;