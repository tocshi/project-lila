event_inherited();

if(path_get_length(ai_path) < aggro_range && point_distance(x,y,obj_player.x,obj_player.y) >= 64 && canMove) {
	// show_debug_message("Player within range");
	mp_potential_step(obj_player.x, obj_player.y, 3, false);
}

recalc_countdown++;
if (recalc_countdown % 30 == 0) {
	getPath(id, obj_player, ai_path);
}
