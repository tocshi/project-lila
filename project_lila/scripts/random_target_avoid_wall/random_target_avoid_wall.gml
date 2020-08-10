var minimum = argument0;
var maximum = argument1;
var orig_x = argument2;
var orig_y = argument3;

for (var i = 0; i < 10; i++) {
	var dir = irandom(359)
	var dist = irandom_range(minimum,maximum)

	dest_x = orig_x + lengthdir_x(dist, dir);
	dest_y = orig_y + lengthdir_y(dist, dir);
	
	// If there is no wall in the path, stop searching
	if (!instance_exists(collision_line_wall(x, y, dest_x, dest_y, false))) {
		break;	
	}
}

return [dest_x, dest_y]