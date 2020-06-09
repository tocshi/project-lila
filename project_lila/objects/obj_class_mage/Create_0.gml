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
/*
skills[0] = "Fireball";
skills[1] = "Blizzard";
skills[2] = "Chain Lightning";
skills[3] = "Spatial Leap";
skills[4] = "Meditative Training";
skills[5] = "Icicle Salvo";
skills[6] = "Lightning Rod";
skills[7] = "Primordial Mana";*/