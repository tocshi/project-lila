/// @description Notified hit

var hitDmg = MAX_HEALTH - statmap[? "hp"];
statmap[? "hp"] = MAX_HEALTH;

// If dummy timed out
if (current_time - last_hit > TIMEOUT) {
	event_user(3);
}
last_hit = current_time;

if (hitDmg > 0) {
	damage += hitDmg;
}
event_user(4);

if (display = noone) {
	event_user(1);	
}