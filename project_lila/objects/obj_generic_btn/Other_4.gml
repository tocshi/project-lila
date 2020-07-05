/// @description Initialize
if (already_init) exit;

if (v_relative_align == CENTRE) {
	top_relative_offset = 0.5;
}

if (h_relative_align == CENTRE) {
	left_relative_offset = 0.5;
}

if (align == CENTRE) {
	x -= width/2;
	gui_x -= width/2;
	y -= height/2;
	gui_y -= height/2;
	left_offset += width/2;
	top_offset += height/2;
}
if (gui_align == CENTRE) {
	gui_x += camera_get_view_width(global.currentCamera)/2;
	gui_y += camera_get_view_height(global.currentCamera)/2;
}

if (auto_scale) {
	image_xscale = width / sprite_width;
	image_yscale = height / sprite_height;
}

already_init = true;
