skill--;
vspeed = 60;
if(skill < room_speed*8){
	vspeed = 0;
	image_index = 1;
	if(skill == room_speed*8-1){mask_index = spr_lightning_rod;}
	else{mask_index = spr_empty;}
	if(skill % 30 == 0){
		ds_list_clear(debuff_hitList);
		var enemies_hit = collision_circle_list(x,y,181,obj_enemy,true,true,debuff_hitList,false);
		for(var i = 0; i < enemies_hit; ++i){
			var target = debuff_hitList[| i];
			applyBuff(target,60,true,"Electrified",buff_generic,false,1,1,spr_buff_electrified,"Elemental Resistances Down!",0);
		}
	}
}
if(skill <= 0){
	instance_destroy();
}

