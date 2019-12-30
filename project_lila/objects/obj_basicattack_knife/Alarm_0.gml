if(!instance_exists(user)){
	instance_destroy();
	exit;
}
with(instance_create_layer(user.x,user.y,"Attacks",obj_basicattack_knife)){
		self.user = other.user;
		sprite_index = make_sprite_from_item(user.equips[0]);
		ds_map_copy(atkmap,user.statmap);
		atkmap[? "dmgmod"] = other.atkmap[? "dmgmod"];
		atkmap[? "element"] = other.atkmap[? "element"];
		atkmap[? "isBasicAttack"] = true;
		atkmap[? "isSingleHit"]	= true;
		
		dir = other.direction;
		skill = round((room_speed/user.statmap[? "atkspeed"])/8);
		image_xscale = -0.5;
		direction = dir;
		image_angle = dir+45+180;
}
instance_destroy();
exit;

