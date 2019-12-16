if(ds_list_find_index(hitList,other.id) == -1){
	ds_list_add(hitList,other.id);
	
	var burndmg = ceil(max(atkmap[? "fire_atk"],atkmap[? "atk"] / 10));
	applyBuff(other,10*room_speed,true,"Burn",buff_generic,false,1,5,spr_buff_burning,"You're on fire!",burndmg);
	dmgCalc(other.id);
	
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
