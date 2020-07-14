/// @description Draw message text

if(text_alpha <= 0) {
	instance_destroy();
}

if(!fading && text_alpha < 1) {
	text_alpha += 0.03
} else if(fading) {
	text_alpha -= 0.02;
}


if(pixel_offset < line_offset * 22) {
	pixel_offset++;
}
if(line_offset > 2) {
	fading = true;
}

draw_set_font(fnt_dialogue_text);
draw_set_halign(fa_center);
draw_set_valign(fa_middle);
draw_text_ext_colour(window_get_width()/2, window_get_height()/2 - pixel_offset - 64, message, 8, room_width/3, c_red, c_red, c_red, c_red, text_alpha);