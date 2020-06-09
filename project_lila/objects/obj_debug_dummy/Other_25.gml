/// @description Notified hit

var hitDmg = MAX_HEALTH - statmap[? "hp"];
statmap[? "hp"] = MAX_HEALTH;

// If dummy timed out
if (current_time - last_hit > TIMEOUT) {
	event_user(dummy_function.reset_dps);
}
last_hit = current_time;

if (hitDmg > 0) {
	damage += hitDmg;
}
event_user(dummy_function.calculate_dps);

if (display = noone) {
	event_user(dummy_function.create_text_box);	
}