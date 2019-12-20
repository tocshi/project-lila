if(ds_list_find_index(hitList,other.id) == -1){
	ds_list_add(hitList,other.id);
	
	dmgCalc(other.id);
	applyBuff(other,30,true,"Chilled",buff_generic,false,1,1,spr_buff_chilled,"The cold slows you down!",0);
	
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

