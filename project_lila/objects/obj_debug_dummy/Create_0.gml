/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
event_inherited();
MAX_HEALTH = 999999999;

statmap[? "maxhp"]			= MAX_HEALTH;
statmap[? "hp"]				= MAX_HEALTH;
statmap[? "hpregen"]		= MAX_HEALTH;

TIMEOUT = 5000;
UPDATE_DELAY = 60;

first_hit = 0;
last_hit = 0;

damage = 0;
seconds = 0;
dps = 0;

width = 64;
height = 64;
display = instance_create_layer(x + width, y - height, "dmgTxt", obj_textbox);
display.width = 300;
display.height = 300;
display.background_alpha = 0.3;
display.background_clr = c_black;
display.valign = fa_center;
display.x_round_radius = 10;
display.y_round_radius = 10;

alarm[1] = UPDATE_DELAY;
