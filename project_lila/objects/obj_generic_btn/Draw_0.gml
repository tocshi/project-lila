if(pressed && image_number > 2){
	image_index = 2;
}
else if(hovered && image_number > 1){
	image_index = 1;
}
else{
	image_index = 0;
}

draw_self();

draw_set_halign(halign);
draw_set_valign(valign);
draw_set_font(font);
draw_set_color(color);
draw_set_alpha(alpha);

var total_top_offset = top_offset + height * top_relative_offset;
var total_left_offset = left_offset + width * left_relative_offset;
var total_right_offset = right_offset + width * right_relative_offset;

//var drawn_text = text;
if (is_outlined) {
	draw_text_outlined(x + total_left_offset, y + total_top_offset, outline_color, color, text);
	draw_set_halign(fa_right);
	draw_text_outlined(x + width - total_right_offset, y + total_top_offset, outline_color, color, right_text);
} else {
    draw_text(x + total_left_offset, y + total_top_offset, text);
	draw_set_halign(fa_right);
	draw_text(x  + width - total_right_offset, y + total_top_offset, right_text);
}
