/// @description Start moving

var dir = irandom(359)
var dist = irandom_range(64,128)

dest_x = x + lengthdir_x(dist, dir);
dest_y = y + lengthdir_y(dist, dir);

is_burrowed = true;
image_index = 1;