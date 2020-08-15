/// @description Burrow
// You can write your code in this editor

mask_index = spr_empty;

if (image_index <= image_number - 1) {
	show_debug_message("IF")
	image_speed = 1;
	show_debug_message("image speed:" + string(image_speed))
	alarm[5] = 1;
} else {
	show_debug_message("ELSE")
	image_speed = 0;
	alarm[1] = 1;
}
