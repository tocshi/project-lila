if (!active) exit;
if (!surface_exists(surface)) {
	surface = surface_create(WIDTH, HEIGHT);
}
var text_pos = HEIGHT - TEXT_HEIGHT;
surface_set_target(surface);
text = keyboard_string;
if (is_caret) {
	string_insert("|", text, string_length(keyboard_string) - caret);
}
draw_text(0, text_pos, text);