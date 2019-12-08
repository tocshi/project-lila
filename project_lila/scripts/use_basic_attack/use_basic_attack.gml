var user = argument0;
var itemid = argument1;
var dmgmod = argument2;

if(itemid <= 0){exit;}

// make iter for multiple patterns
if(!variable_instance_exists(user, "iter")){iter = 0;}

// resolve player weapon element
var element = user.atkelement;

// resolve player buffs
if(hasBuff(user,"Empowered")){
	dmgmod *= 2.5;
	removeBuff(user,"Empowered",false);
}

//switch statement for different things
switch(itemid){
	
	// Longsword Default Basic Attack
	case 10:
	case 22:
	case 23:
	with(instance_create_layer(x,y,"Attacks",obj_basicattack_longsword)){
		sprite_index = make_sprite_from_item(itemid);
		iter = other.iter;
		anchor = argument0;
		self.user = user;
		ds_map_copy(atkmap,user.statmap);
		atkmap[? "dmgmod"] = dmgmod;
		atkmap[? "element"] = element;
		atkmap[? "isBasicAttack"] = true;
		atkmap[? "isSingleHit"]	= true;
		
		dir = point_direction(x,y,mouse_x,mouse_y);
		skill = round(room_speed/user.statmap[? "atkspeed"]);
		switch(iter % 2){
			case 0:
			image_angle = dir-(angle/2);
			break;
	
			case 1:
			image_angle = dir+(angle/2);
			break;
		}
		image_angle-=45;
	}
	break;
	
	// Bow Default Basic Attack
	case 11:
	case 24:
	with(instance_create_layer(x,y,"Attacks",obj_basicattack_bow)){
		sprite_index = make_sprite_from_item(itemid);
		sprite_collision_mask(sprite_index,false,2,0,0,0,0,bboxkind_rectangular,0);
		
		anchor = argument0;
		image_angle = point_direction(x,y,mouse_x,mouse_y);
		skill = round(room_speed/user.statmap[? "atkspeed"]);
		image_angle-=45;
	}
	with(instance_create_layer(x,y,"Attacks",obj_basicattack_arrow)){
		self.user = user;
		ds_map_copy(atkmap,user.statmap);
		atkmap[? "dmgmod"] = dmgmod;
		atkmap[? "element"] = element;
		atkmap[? "isBasicAttack"] = true;
		atkmap[? "isSingleHit"]	= true;
		atkmap[? "range"] = 480;
		atkmap[? "isProjectile"] = true;
		atkmap[? "isPiercing"] = false;
		
		skill = atkmap[? "range"]/speed;
		direction = point_direction(x,y,mouse_x,mouse_y) + random_range(-2,2);
		image_angle = direction;
	}
	break;
	
	// Spellbook Default Basic Attack
	case 18:
	case 31:
	var magic_target = instance_nearest(mouse_x,mouse_y,obj_enemy);
	if(point_distance(x,y,magic_target.x,magic_target.y) > 420){exit;}
	with(instance_create_layer(x,y,"Attacks",obj_basicattack_spellbook)){
		sprite_index = make_sprite_from_item(itemid);
		
		anchor = argument0;
		image_angle = point_direction(x,y,mouse_x,mouse_y);
		skill = round(room_speed/user.statmap[? "atkspeed"]);
		image_angle-=45;
	}
	with(instance_create_layer(x,y,"Attacks",obj_basicattack_magic)){
		self.user = user;
		ds_map_copy(atkmap,user.statmap);
		target = magic_target;
		atkmap[? "dmgmod"] = dmgmod;
		atkmap[? "element"] = element;
		atkmap[? "isBasicAttack"] = true;
		atkmap[? "isSingleHit"]	= true;
		atkmap[? "isProjectile"] = true;
		atkmap[? "isPiercing"] = false;
		
		direction = point_direction(x,y,magic_target.x,magic_target.y);
		image_angle = direction;
	}
	break;
	
	default:
	show_debug_message("ERROR: NO BASIC ATTACK FOUND!");
	break;
}
iter++;
