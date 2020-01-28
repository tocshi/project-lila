if (!surface_exists(surface)) {
	surface = surface_create(WIDTH, HEIGHT);
}
var text_pos = HEIGHT - TEXT_HEIGHT;

draw_self();
// Trim lines past MAX_INPUT_LENGTH chars

for (i = each(lines, ds_type_list); as(); iterate();) {
	var done = false;
	var j = 0;
	while (!done) {
		break;
	}
}

text = keyboard_string;
if (is_caret) {
	text += "|";
}
text += after_caret;

draw_set_halign(fa_left);
draw_set_valign(fa_top);
draw_set_font(fnt_gui_small);
draw_set_color(c_green)
draw_text(x, y + text_pos, text);
for (var i = ds_list_size(lines) - 1; i >= 0; i--) {
	text_pos -= TEXT_HEIGHT;
	draw_text(x, y + text_pos, lines[| i]);
}
