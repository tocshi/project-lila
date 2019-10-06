//Stats
atkmap = ds_map_create();
/*
atkmap[? "element"]			= "none";

atkmap[? "sourceX"]			= 0;
atkmap[? "sourceY"]			= 0;
atkmap[? "flinch_amount"]	= 0;

atkmap[? "isProjectile"]	= false;
atkmap[? "isPiercing"]		= false;
atkmap[? "isSingleTarget"]	= false;
atkmap[? "isBasicAttack"]	= false;
atkmap[? "isSingleHit"]		= false;
atkmap[? "isBuff"]			= false;

atkmap[? "isCrit"]			= false;
atkmap[? "isOrangeCrit"]	= false;
atkmap[? "isRedCrit"]		= false;
*/

//List that stores enemies hit by this attack.
hitList = ds_list_create();

//debug
show_debug_message(string(ds_map_exists(atkmap, "dmgmod")));



