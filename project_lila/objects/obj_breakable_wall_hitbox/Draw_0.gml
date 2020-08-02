draw_self();

if(statmap[? "hp"] < statmap[? "maxhp"]*0.40){
	visible_wall_obj.image_index = 2;
}
else if(statmap[? "hp"] < statmap[? "maxhp"]*0.80){
	visible_wall_obj.image_index = 1;
}
else {
	visible_wall_obj.image_index = 0;
}
event_inherited();
