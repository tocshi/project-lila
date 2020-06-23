/// @description Initialize
if (already_init) exit;

if (align == CENTRE) {
	x -= width/2;
	y -= height/2;
	left_offset += width/2;
	top_offset += height/2;
}

if (auto_scale) {
	image_xscale = width / sprite_width;
	image_yscale = height / sprite_height;
}

already_init = true;