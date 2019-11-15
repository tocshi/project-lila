// Stats
statmap = ds_map_create();

statmap[? "level"] 			= 0;
statmap[? "maxhp"]			= 100;
statmap[? "hp"]				= 100;
statmap[? "hpshield"]		= 0;
statmap[? "hpregen"]		= 0.02;
statmap[? "maxmp"]			= 100;
statmap[? "mp"]				= 100;
statmap[? "mpregen"]		= 0.1666;
statmap[? "atk"]			= 10;
statmap[? "def"]			= 0;

statmap[? "fire_atk"]		= 0;
statmap[? "ice_atk"]		= 0;
statmap[? "lightning_atk"]	= 0;
statmap[? "earth_atk"]		= 0;
statmap[? "wind_atk"]		= 0;
statmap[? "light_atk"]		= 0;
statmap[? "dark_atk"]		= 0;

statmap[? "fire_def"]		= 0;
statmap[? "ice_def"]		= 0;
statmap[? "lightning_def"]	= 0;
statmap[? "earth_def"]		= 0;
statmap[? "wind_def"]		= 0;
statmap[? "light_def"]		= 0;
statmap[? "dark_def"]		= 0;

statmap[? "movespeed"]		= 3;
statmap[? "atkspeed"]		= 2;
statmap[? "critrate"]		= 0;
statmap[? "critdmg"]		= 150;
statmap[? "finaldmg"]		= 100;
statmap[? "finalshld"]		= 0;
statmap[? "blkmod"]			= 50;

canKnockback	= false;
isDead			= false;
canAttack = true;
canUseSkill = true;
isBlocking = false;
isCCed = false;
isDead = false;
isMoving = false;
canMove = true;

atkTimer = 0;
statChange = true;

buff = ds_list_create();
