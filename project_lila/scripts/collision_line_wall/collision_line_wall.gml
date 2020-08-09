var orig_x = argument0;
var orig_y = argument1;
var target_x = argument2;
var target_y = argument3;
var prec = argument4;

if (prec == undefined) {
	prec = false;
}

var walls = [obj_wall_parent]

for (var i = 0; i < array_length_1d(walls); i++) {
	var result = collision_line(orig_x, orig_y, target_x, target_y, walls[i], prec, false);
	if (result != noone) {
		return result;	
	}
}

return result;