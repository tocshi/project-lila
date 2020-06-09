if(hasBuff(other,"Invisible")){exit;}
if(ds_list_find_index(user.s_shot_hitList,other.id) == -1){
	ds_list_add(user.s_shot_hitList,other.id);
	
	dmgCalc(other.id);
	summon_stormpiercer_at_rate(user,other,20);
	
	if(ds_map_find_value(global.itemData[| global.player.equips[0]],"unleashGauge") > 0 && global.player.essence >= 0){
		if(random_range(0,100) < other.statmap[? "essence_rate"]){
			var essence = instance_create_layer(other.x,other.y,"Items",obj_essence);
			essence.target = global.player;
		}
	}
	
	if(ds_map_exists(atkmap,"isPiercing") && ds_map_exists(atkmap,"isProjectile")){
		if(!atkmap[? "isPiercing"]){
			ds_map_destroy(atkmap);
			atkmap = -1;
			instance_destroy();
		}
	}
}
