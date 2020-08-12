/// @description bite attack
if(!instance_exists(target)){exit;}
// calculate attack position
var targetdir = point_direction(x,y,target.x,target.y);
var targetdist = min(64,point_distance(x,y,target.x,target.y));
var xx = lengthdir_x(targetdist,targetdir);
var yy = lengthdir_y(targetdist,targetdir);
// face the target
destX = x+(xx/2);
destY = y+(yy/2);
isMoving = true;
movedir = targetdir;
// Create Attack obj
with(instance_create_layer(x+xx,y+yy,"Attacks",obj_enemy_attack_bite)){
	user = other;
	ds_map_copy(atkmap,user.statmap);
	atkmap[? "dmgmod"]			= 100;

	atkmap[? "element"]			= "none";
	atkmap[? "isSingleHit"]		= true;
}
