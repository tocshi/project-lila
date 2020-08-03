speed += (random_range(-1,1));
speed = clamp(speed,3,15);
if(collision_point(x, y, target, true, true)){
	dmgCalc(target.id);
	if(ds_map_find_value(global.itemData[| global.player.equips[0]],"unleashGauge") > 0 && global.player.essence >= 0){
		if(random_range(0,100) < target.statmap[? "essence_rate"]){
			var essence = instance_create_layer(target.x,target.y,"Items",obj_essence);
			essence.target = global.player;
		}
	}
	instance_destroy();
	exit;
}


