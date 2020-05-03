event_inherited();

statmap[? "class"] = "Mage";
c_lightning_hitList = ds_list_create();
i_salvo_hitList = ds_list_create();
i_salvo_coords = array_create(6,[0,0]);
//idk how to automatically set coordinates in a hexagon formation
i_salvo_coords[0,0] = 0;
i_salvo_coords[0,1] = -96;
i_salvo_coords[1,0] = 72;
i_salvo_coords[1,1] = -48;
i_salvo_coords[2,0] = 72;
i_salvo_coords[2,1] = 48;
i_salvo_coords[3,0] = 0;
i_salvo_coords[3,1] = 96;
i_salvo_coords[4,0] = -72;
i_salvo_coords[4,1] = 48;
i_salvo_coords[5,0] = -72;
i_salvo_coords[5,1] = -48;
i_salvo_targets = ds_list_create();

skill_sprite = spr_skill_icons_mage;

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

maxcd[1] = room_speed*3;
maxcd[2] = room_speed*3;
maxcd[3] = room_speed*3;
maxcd[4] = room_speed*7;
maxcd[5] = room_speed*0;
maxcd[6] = room_speed*18;
maxcd[7] = room_speed*18;
maxcd[8] = room_speed*18;
maxcd[9] = room_speed*8;
maxcd[10] = room_speed*32;