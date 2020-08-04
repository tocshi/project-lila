/// @description Do physics/perspective calcs

x += x_vel/time_factor;
y += y_vel/time_factor;
height += z_vel/time_factor;
z_vel += grav/time_factor;

if (height < floor_height) {
	x_vel *= bounciness;
	y_vel *= bounciness;
	z_vel *= -1 * bounciness;
	height = floor_height;
}

if (height >= camera_height) {
	z_vel = 0;
	height = camera_height - 0.01;
}

scale = (size * 10)/(camera_height - height);
image_xscale = scale;
image_yscale = scale;