event_inherited();

atkmap[? "dmgmod"]			= 120;

atkmap[? "element"]			= "fire";
atkmap[? "range"]			= 512;

atkmap[? "isProjectile"]	= true;
atkmap[? "isPiercing"]		= false;
atkmap[? "isSingleTarget"]	= true;
atkmap[? "isSingleHit"]		= true;

direction = point_direction(x,y,mouse_x,mouse_y);
image_angle = direction;
speed = 10;

skill = atkmap[? "range"]/speed;