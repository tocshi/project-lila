var modifier = argument0;

isMoving = false;
atkTimer += 100;
canMove = false;
canAttack = false;
canUseSkill = false;
applyBuff(global.player,100,false,"Invulnerable",buff_generic,true,-1,0,spr_empty,"",0);
instance_create_layer(0,0,"Assets_1",obj_player_cutin);
script_execute(asset_get_index(ds_map_find_value(global.itemData[| equips[0]],"unleashSkill")),modifier,90);