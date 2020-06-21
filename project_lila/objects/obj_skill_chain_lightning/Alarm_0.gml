ds_list_add(user.c_lightning_hitList,target);
if(!instance_exists(target) || !instance_exists(anchor)){	
	instance_destroy();
	exit;
}
if(primordial){
	with(instance_create_layer(target.x,target.y,"Attacks",obj_skill_supercell_lightning)){
		target = other.target;
		user = other.user;
		ds_map_copy(atkmap,user.statmap);
		atkmap[? "dmgmod"]			= 200;
		atkmap[? "element"]			= "lightning";
	}
}

dmgCalc(target.id);
if(ds_map_find_value(global.itemData[| global.player.equips[0]],"unleashGauge") > 0 && global.player.essence >= 0){
	if(random_range(0,100) < target.statmap[? "essence_rate"]){
		var essence = instance_create_layer(target.x,target.y,"Items",obj_essence);
		essence.target = global.player;
	}
}

if(remaining > 0){
	next_target = instance_nth_nearest(obj_enemy,target.x,target.y,2);
	var target_list = ds_list_create();
	var num = collision_circle_list(target.x,target.y,320,obj_enemy,true,true,target_list,true);
	for(var i = 0; i < num; ++i){
		if(ds_list_find_index(user.c_lightning_hitList,target_list[| i]) == -1){
			next_target = target_list[| i];
			break;
		}
		if(i == num-1){ds_list_clear(user.c_lightning_hitList)}
	}
	
	if(next_target != noone && point_distance(target.x,target.y,next_target.x,next_target.y) <= 320){
		with(instance_create_layer(x,y,"Attacks",obj_skill_chain_lightning)){
			user = other.user;
			anchor = other.target;
			target = other.next_target;
			ds_map_copy(atkmap,user.statmap);
			atkmap[? "dmgmod"]			= other.atkmap[? "dmgmod"]-20;
			atkmap[? "element"]			= "lightning";
			
			atkmap[? "isSingleTarget"]	= true;
			atkmap[? "isSingleHit"]		= true;
			remaining = other.remaining-1;
			primordial = other.primordial;
		}
	}
}