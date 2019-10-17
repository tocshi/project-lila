event_inherited();

if(path_get_length(ai_path) < aggro_range) {
	// show_debug_message("Player within range");
	mp_potential_step(obj_player.x, obj_player.y, 2, false);
}

recalc_countdown--;
if (recalc_countdown <= 0) {
	getPath(id, obj_player, ai_path);
	recalc_countdown = 60;
}
