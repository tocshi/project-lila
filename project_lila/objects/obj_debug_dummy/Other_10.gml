/// @description Notified hit

var hitDmg = MAX_HEALTH - statmap[? "hp"];
statmap[? "hp"] = MAX_HEALTH;

// If dummy timed out
if (current_time - last_hit > TIMEOUT) {
	event_user(events.reset_dps);
}
last_hit = current_time;

if (hitDmg > 0) {
	damage += hitDmg;
}
event_user(events.calculate_dps);

if (display = noone) {
	event_user(events.create_text_box);	
}