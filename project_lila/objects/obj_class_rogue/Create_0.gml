event_inherited();

statmap[? "class"] = "Rogue";
t_fang = 0;
s_step_target = noone;
v_thief_target = noone;
v_thief_count = 0;
s_slicer_target = noone;
s_slicer_remaining = 0;

skill_sprite = spr_skill_icons_rogue;

// TEMPORARY UNTIL SKILL REWORK
skill_icon_mapping = array_create(10,0);
skill_icon_mapping[0] = 0;
skill_icon_mapping[1] = 1;
skill_icon_mapping[2] = 2;
skill_icon_mapping[3] = 3;
skill_icon_mapping[4] = 4;
skill_icon_mapping[5] = 5;
skill_icon_mapping[6] = 6;
skill_icon_mapping[7] = 7;
skill_icon_mapping[8] = 8;
skill_icon_mapping[9] = 9;

maxcd[1] = room_speed*7;
maxcd[2] = room_speed*10;
maxcd[3] = room_speed*16;
maxcd[4] = room_speed*0;
maxcd[5] = room_speed*1;
maxcd[6] = room_speed*1;
maxcd[7] = room_speed*14;
maxcd[8] = room_speed*0;
maxcd[9] = room_speed*60;
maxcd[10] = room_speed*15;