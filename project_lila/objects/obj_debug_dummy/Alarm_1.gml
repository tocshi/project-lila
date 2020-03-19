/// @description Update dps

alarm[1] = UPDATE_DELAY;

// Reset on timeout
if (current_time - last_hit > TIMEOUT) {
	event_user(3);
}
if (current_time - last_hit > DELETE_TEXT_TIMEOUT) {
	event_user(2);	
}

event_user(4);
