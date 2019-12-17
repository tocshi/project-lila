if (!surface_exists(surface)) {
	surface = surface_create(WIDTH, HEIGHT);
}
var text_pos = HEIGHT - TEXT_HEIGHT;
//surface_set_target(surface);
draw_self();

text = keyboard_string;
if (is_caret) {
	string_insert("|", text, string_length(keyboard_string) - caret);
}
draw_set_halign(fa_left);
draw_set_valign(fa_top);
draw_set_font(fnt_gui_small);
draw_set_color(c_green)
draw_text(x, y + text_pos, text);
for (var i = ds_list_size(lines) - 1; i >= 0; i--) {
	text_pos -= TEXT_HEIGHT;
	draw_text(x, y + text_pos, lines[| i]);
}
//surface_reset_target();