draw_sprite(true_sprite, 0, x, y);
draw_set_halign(halign);
draw_set_valign(valign);
draw_set_font(font);
draw_set_color(color);
draw_set_alpha(alpha);

if (is_outlined) {
	draw_text_outlined(x + left_offset, y + top_offset, outline_color, color, text);
} else {
    draw_text(x + left_offset, y + top_offset, text);
}