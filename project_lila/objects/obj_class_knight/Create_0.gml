event_inherited();

statmap[? "class"] = "Knight";

skill_sprite = spr_skill_icons_knight;
f_challenge_list = ds_list_create();
shield_charge = 0;
charge_direction = 0;
scList = ds_list_create();
guardian_target = noone;
following_ally = false;
protective_footwork_mod = 0;
footwork_charge = 0;
origatk = basestatmap[? "atk"];
origdef = basestatmap[? "def"];

// TEMPORARY UNTIL SKILL REWORK
skill_icon_mapping = array_create(10,0);
skill_icon_mapping[0] = 0;
skill_icon_mapping[1] = 1;
skill_icon_mapping[2] = 2;
skill_icon_mapping[3] = 3;
skill_icon_mapping[4] = 4;
skill_icon_mapping[5] = 5;
skill_icon_mapping[6] = 6;
skill_icon_mapping[7] = 9;
skill_icon_mapping[8] = 10;
skill_icon_mapping[9] = 12;

maxcd[1] = room_speed*5;
maxcd[2] = room_speed*14;
maxcd[3] = room_speed*6;
maxcd[4] = room_speed*2;
maxcd[5] = room_speed*6;
maxcd[6] = room_speed*12;
maxcd[7] = room_speed*16;
maxcd[8] = room_speed*9;
maxcd[9] = room_speed*1;
maxcd[10] = room_speed*5;