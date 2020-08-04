/// @description Make dirt

if (tick % 5 == 0) {
	with (instance_create_layer(x, y, "Instances", obj_flying_dirt)) {
		x = other.x;
		y = other.y;
		x_vel = random_range(-20, 20);
		y_vel = random_range(-20, 20);
		z_vel = random_range(5, 10);
		time_factor = 30;
		size = 1;
		image_angle = irandom(359)
	}
}

if (is_burrowed) {
	alarm[4] = 1;
}
