event_inherited();

user = global.player;
sprite = make_sprite_from_item(user.equips[0]);
sprite_index = sprite;
image_angle = point_direction(x,y,mouse_x,mouse_y) - 45;

