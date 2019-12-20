if(ds_list_find_index(hitList,other.id) == -1){
	ds_list_add(hitList,other.id);
	
	dmgCalc(other.id);
	applyBuff(other,180,false,"Stunned",cc_stun,false,1,1,spr_debug_wall,"Stunned! Can't do anything!",0);
	var stunEffect = instance_create_layer(other.x,other.y,"Assets_1",obj_stun_effect);
	stunEffect.user = other.id;
	
	if(ds_map_find_value(global.itemData[| global.player.equips[0]],"unleashGauge") > 0 && global.player.essence >= 0){
		if(random_range(0,100) < other.statmap[? "essence_rate"]){
			var essence = instance_create_layer(other.x,other.y,"Items",obj_essence);
			essence.target = global.player;
		}
	}
	/*
	if (other.canKnockback){
		hit_flinch(other, point_direction(sourceX,sourceY,other.x,other.y), flinch_amount);
	}*/
}

