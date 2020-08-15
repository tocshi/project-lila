/// @description Unburrow
// You can write your code in this editor

is_unburrowing = true;
mask_index = spr_florret;
if (image_index != 0) {
	image_speed = -1;
	alarm[6] = 1;
} else {
	image_speed = 0;
	is_unburrowing = false;
	is_burrowed = false;
}
