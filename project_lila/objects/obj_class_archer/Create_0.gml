event_inherited();

statmap[? "class"] = "Archer";

skill_sprite = spr_skill_icons_archer;
s_shot_hitList = ds_list_create();
t_shot_remaining = 0;

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

maxcd[1] = room_speed*2.2;
maxcd[2] = room_speed*10;
maxcd[3] = room_speed*2.2;
maxcd[4] = room_speed*8;
maxcd[5] = room_speed*48;
maxcd[6] = room_speed*12;
maxcd[7] = room_speed*0;
maxcd[8] = room_speed*60;
maxcd[9] = room_speed*15;
maxcd[10] = room_speed*0;