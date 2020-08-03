/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
event_inherited();

view_height = camera_get_view_height(global.currentCamera) - 0.02*global.game_height - sprite_get_height(gui_dialogue_box);;
is_gui = true;
gui_halign = CENTRE;
width = camera_get_view_width(global.currentCamera)*2/3;
height = view_height/16;
font = fnt_dialogue_text;
align = CENTRE;
halign = fa_center;
valign = fa_center;

button_number = 1;
number_of_buttons = 1;

