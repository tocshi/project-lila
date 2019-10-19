/// @description "Try to find a path to the target"
/// @param0 object to calculate path for
/// @param1 target object
/// @param2 path to write to

var s = argument0;
var f = argument1;

_sx = s.x;
_sy = s.y;
_fx = f.x;
_fy = f.y;
ai_path = argument2;

if (!mp_grid_path(global.ai_grid, ai_path, _sx, _sy, _fx, _fy, true)) {
	show_debug_message("Path not found");
} else {
	path_set_kind(ai_path, 1);
	path_set_precision(ai_path, 8);
	// show_debug_message("path of length" +  string(path_get_length(ai_path)) + "created");
}