/// @description Update dps

alarm[1] = UPDATE_DELAY;

// Reset on timeout
if (current_time - last_hit > TIMEOUT) {
	event_user(events.reset_dps);
}
if (current_time - last_hit > DELETE_TEXT_TIMEOUT) {
	event_user(events.remove_text_box);	
}

event_user(events.calculate_dps);
