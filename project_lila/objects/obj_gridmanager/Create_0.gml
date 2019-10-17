/// @description Initialize grid with solid objects
// You can write your code in this editor
global.ai_grid = mp_grid_create(0, 0, room_width / 16, room_height / 16, 16, 16);
mp_grid_add_instances(global.ai_grid, obj_debug_wall, false);