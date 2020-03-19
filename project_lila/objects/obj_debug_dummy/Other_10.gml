/// @description Notified hit

var hitDmg = MAX_HEALTH - statmap[? "hp"];
statmap[? "hp"] = MAX_HEALTH;

if (hitDmg > 0) {
	damage += hitDmg;
}

// If dummy timed out
if (current_time - last_hit > TIMEOUT) {
	first_hit = current_time;
	damage = 0;
}
last_hit = current_time;

// Avoid division by 0 on first hit to dummy
seconds = (current_time - first_hit)/1000;
var divisor = seconds;
if (seconds == 0) {
	divisor = 1;
}
dps = damage / divisor;
