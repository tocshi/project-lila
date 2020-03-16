/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
event_inherited();
MAX_HEALTH = 999999999999;

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

display = instance_create_layer(x, y, "dmgTxt", obj_textbox);
display.width = 100;
display.height = 200;
display.x_round_radius = 10;
display.y_round_radius = 10;

alarm[1] = UPDATE_DELAY;
