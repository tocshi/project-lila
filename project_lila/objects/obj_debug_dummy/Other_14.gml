/// @description Calculate dps
seconds = (current_time - first_hit)/1000;
var divisor = seconds;
// Avoid division by 0 when dummy hasn't been hit yet
if (seconds == 0) {
	divisor = 1;
}
dps = damage / divisor;