/// @description Start moving

// Try 10 times to find a destination that doesn't go through a wall
for (var i = 0; i < 10; i++) {
	var dir = irandom(359)
	var dist = irandom_range(128,256)

	dest_x = x + lengthdir_x(dist, dir);
	dest_y = y + lengthdir_y(dist, dir);
	
	// If there is no wall in the path, stop searching
	if (!instance_exists(collision_line_wall(x, y, dest_x, dest_y, false))) {
		break;	
	}
}

is_burrowed = true;
start_moving_tick = tick;
mask_index = spr_empty;
has_attacked = false;
num_atks = irandom_range(2, 4);
cur_atk = 0;
image_index = 1;
alarm[4] = 1;