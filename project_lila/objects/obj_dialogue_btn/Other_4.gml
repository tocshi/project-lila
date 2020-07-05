/// @description Insert description here
// You can write your code in this editor

// Top of bounding area for dialogue buttons
gui_y = -view_height/4;

button_area_height = view_height/2;

gui_y += button_number*(button_area_height/(number_of_buttons + 1));

// Inherit the parent event
event_inherited();

