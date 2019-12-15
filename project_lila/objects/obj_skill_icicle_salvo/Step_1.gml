if(ds_map_exists(atkmap,"isPiercing") && ds_map_exists(atkmap,"isProjectile")){
	if(!atkmap[? "isPiercing"] && collision_point(x, y, obj_wall_parent, false, true)){
		sprite_index = spr_debug_indicator;
		image_blend = c_aqua;
		mask_index = sprite_index;
		speed = 0;
		image_xscale = 2;
		image_yscale = image_xscale;
		alarm[1] = 1;
		fading = true;
	}
}
if(point_distance(x,y,target.x,target.y) < 64){
	sprite_index = spr_debug_indicator;
	image_blend = c_aqua;
	mask_index = sprite_index;
	speed = 0;
	image_xscale = 2;
	image_yscale = image_xscale;
	alarm[1] = 1;
	fading = true;
}
