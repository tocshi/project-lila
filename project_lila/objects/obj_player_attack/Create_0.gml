//Stats
atkmap = ds_map_create();
ds_map_copy(atkmap,global.player.statmap);
/*
atkmap[? "element"]			= "none";
atkmap[? "dmgmod"]			= 0;

atkmap[? "sourceX"]			= 0;
atkmap[? "sourceY"]			= 0;
atkmap[? "flinch_amount"]	= 0;
atkmap[? "range"]			= 0;

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

// Has this projectile been affected by Gate of Wind?
gateOfWind = false;



