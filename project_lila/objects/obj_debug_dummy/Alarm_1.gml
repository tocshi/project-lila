/// @description Update dps

alarm[1] = UPDATE_DELAY;

// Reset on timeout
if (current_time - last_hit > TIMEOUT) {
	last_hit = current_time;
	first_hit = current_time;
	damage = 0;
}

seconds = (current_time - first_hit)/1000;
var divisor = seconds;

// Avoid division by 0 when dummy hasn't been hit yet
if (seconds == 0) {
	divisor = 1;
}
dps = damage / divisor;
