if(pressed && image_number > 2){
	draw_sprite(sprite_index,2,x,y);
}
else if(hovered && image_number > 1){
	draw_sprite(sprite_index,1,x,y);
}
else{
	draw_self();
}

draw_set_halign(halign);
draw_set_valign(valign);
draw_set_font(font);
draw_set_color(color);
draw_set_alpha(alpha);

//var drawn_text = text;
if (is_outlined) {
	draw_text_outlined(x + left_offset, y + top_offset, outline_color, color, text);
} else {
    draw_text(x + left_offset, y + top_offset, text);
}