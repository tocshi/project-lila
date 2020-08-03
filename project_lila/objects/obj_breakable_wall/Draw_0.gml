if(statmap[? "hp"] < statmap[? "maxhp"]*0.40){image_index = 2;}
else if(statmap[? "hp"] < statmap[? "maxhp"]*0.80){image_index = 1;}
else {image_index = 0;}
event_inherited();

