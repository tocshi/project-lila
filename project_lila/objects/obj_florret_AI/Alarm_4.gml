/// @description Make dirt
	var vel_dist = irandom(20);
	var vel_dir = irandom(359);
	var vel_x = lengthdir_x(vel_dist, vel_dir);
	var vel_y = lengthdir_y(vel_dist, vel_dir);
with (instance_create_layer(x, y, "Items", obj_flying_dirt)) {
	x_vel = vel_x;
	y_vel = vel_y;
	z_vel = random_range(10, 12.5);
	time_factor = 10;
	bounciness = 0.6;
	size = 0.1;
	image_angle = irandom(359)
}

if (tick % 5 == 0) {
	var dist = irandom(20);
	var dir = point_direction(x, y, dest_x, dest_y);
	dir += 90;
	var dirt_x = x + lengthdir_x(dist, dir);
	var dirt_y = y + lengthdir_y(dist, dir);
	with (instance_create_layer(dirt_x, dirt_y, "Instances", obj_ground_dirt)) {
		decay_time = 25;
		image_angle = irandom(359);
		image_xscale = 0.75;
		image_yscale = 0.75;
	}
}

if (is_burrowed) {
	alarm[4] = 1;
}
