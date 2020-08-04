/// @description Start moving

show_debug_message("move")
var dir = irandom(359)
var dist = irandom_range(128,256)

show_debug_message(dist)
dest_x = x + lengthdir_x(dist, dir);
dest_y = y + lengthdir_y(dist, dir);

is_burrowed = true;
mask_index = spr_empty;
has_attacked = false;
num_atks = irandom_range(2, 4);
cur_atk = 0;
image_index = 1;