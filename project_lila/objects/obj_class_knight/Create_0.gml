event_inherited();

statmap[? "class"] = "Knight";

skill_sprite = array_create(10, spr_empty);
iter0 = 0;
empowered_buff = false;
shield_charge = 0;
scList = ds_list_create();
target = noone;
following_ally = false;
protective_footwork_mod = 0;
footwork_charge = 0;
origatk = basestatmap[? "atk"];
origdef = basestatmap[? "def"];

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

maxcd[1] = room_speed*5;
maxcd[2] = room_speed*1.5;
maxcd[3] = room_speed*6;
maxcd[4] = room_speed*2;
maxcd[5] = room_speed*6;
maxcd[6] = room_speed*12;
maxcd[7] = room_speed*16;
maxcd[8] = room_speed*9;
maxcd[9] = room_speed*1;
maxcd[10] = room_speed*5;