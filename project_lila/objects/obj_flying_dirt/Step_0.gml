/// @description Insert description here
// You can write your code in this editor

event_inherited()

if (cur_tick > lifetime) {
	image_alpha -= 0.02;	
}
if (image_alpha == 0) {
	instance_destroy();	
}
cur_tick ++;