if (!active) exit;
if (!surface_exists(surface)) {
	surface = surface_create(WIDTH, HEIGHT);
}
var cur_text_height = HEIGHT - TEXT_HEIGHT;