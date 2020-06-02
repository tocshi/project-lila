// check for hover or press
if(instance_position(mouse_x,mouse_y,id) != noone){
	hovered = true;
	if(mouse_check_button_pressed(mb_left)){
		pressed = true;
	}
}
else{
	pressed = false;
	hovered = false;
}