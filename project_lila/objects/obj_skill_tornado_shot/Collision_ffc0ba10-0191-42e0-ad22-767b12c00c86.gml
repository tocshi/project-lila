if(ds_list_find_index(hitList,other.id) == -1){
	ds_list_add(hitList,other.id);
	
	dmgCalc(other.id);
	summon_stormpiercer_at_rate(user,other,10);
	if(other.canKnockback){
		// TODO: make these into functions when 2.3 comes
		other.atkTimer += max(0,20-other.atkTimer);
		other.alarm[1] = 20;
		other.direction = direction+random_range(-30,30);
		other.speed = 4;
		other.canMove = false;
	}
	
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

