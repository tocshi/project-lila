/// @description Initialize
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
