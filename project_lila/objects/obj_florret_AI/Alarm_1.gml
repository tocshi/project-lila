/// @description Start moving

// Try 10 times to find a destination that doesn't go through a wall
if (instance_exists(target)) {
	var orig_x = target.x;
	var orig_y = target.y;
} else {
	var orig_x = x;
	var orig_y = y;
}

var dest = random_target_avoid_wall(256, 350, orig_x, orig_y);
dest_x = dest[0];
dest_y = dest[1];

is_burrowed = true;
start_moving_tick = tick;
has_attacked = false;
num_atks = irandom_range(2, 4);
cur_atk = 0;
alarm[4] = 1;