event_inherited();

direction = point_direction(x,y,mouse_x,mouse_y);
image_angle = direction;
image_alpha = 0;
image_xscale = 1.5;
image_yscale = 1.5;
mask_index = spr_empty;
alarm[6] = 0.5*room_speed;
skill = room_speed*2;
user = noone;