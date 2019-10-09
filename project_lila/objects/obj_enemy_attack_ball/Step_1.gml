if(!mapset){
	ds_map_copy(atkmap,attacker.statmap);
	mask_index = spr_fireball;
	mapset = true;
	
	atkmap[? "dmgmod"]			= 100;

	atkmap[? "element"]			= "none";
	atkmap[? "range"]			= 512;

	atkmap[? "isProjectile"]	= true;
	atkmap[? "isPiercing"]		= false;
	atkmap[? "isSingleTarget"]	= true;
	atkmap[? "isSingleHit"]		= true;
	
	skill = atkmap[? "range"]/speed;
}