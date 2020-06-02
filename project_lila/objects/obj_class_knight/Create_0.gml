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
/*
skills[0] = "Empowered Strike";
skills[1] = "Guardian";
skills[2] = "Shield Charge";
skills[3] = "Roundslash";
skills[4] = "All-Rounder";
skills[5] = "Protective Footwork";
skills[6] = "Aegis Aura";
skills[7] = "Greater Shielding";*/