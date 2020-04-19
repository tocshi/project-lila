/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
event_inherited();
MAX_HEALTH = 999999999;

basestatmap[? "maxhp"]			= MAX_HEALTH;
basestatmap[? "hp"]				= MAX_HEALTH;
basestatmap[? "hpregen"]		= MAX_HEALTH;

TIMEOUT = 5000;
DELETE_TEXT_TIMEOUT = 2 * TIMEOUT;
UPDATE_DELAY = 60;

first_hit = current_time;
last_hit = current_time;

damage = 0;
seconds = 0;
dps = 0;
hits = 0;

display = noone;

width = 64;
height = 64;

alarm[1] = UPDATE_DELAY;
