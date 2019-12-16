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

skill_sprite = array_create(10, spr_empty);

skill_sprite[0] = spr_skill_Q;
skill_sprite[1] = spr_skill_W;
skill_sprite[2] = spr_skill_E;
skill_sprite[3] = spr_skill_R;
skill_sprite[4] = spr_skill_T;
skill_sprite[5] = spr_skill_A;
skill_sprite[6] = spr_skill_S;
skill_sprite[7] = spr_skill_D;
skill_sprite[8] = spr_skill_F;
skill_sprite[9] = spr_skill_G;

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