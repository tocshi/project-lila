// Stats
statmap = ds_map_create();
basestatmap = ds_map_create();

statmap[? "level"] 			= 0;
statmap[? "class"]			= "Debug";
statmap[? "maxhp"]			= 100 + statmap[? "level"]*10 + round(sqr(statmap[? "level"])/10);
statmap[? "hp"]				= 100 + statmap[? "level"]*10 + round(sqr(statmap[? "level"])/10);
statmap[? "hpshield"]		= 0;
statmap[? "hpregen"]		= statmap[? "maxhp"]/100/60;//0.02 + statmap[? "level"]*0.002;
statmap[? "maxmp"]			= 100;
statmap[? "mp"]				= 100;
statmap[? "mpregen"]		= 0.1666; //doubled if canMove && !isMoving
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
statmap[? "base_movespeed"] = 3;
statmap[? "atkspeed"]		= 2;
statmap[? "critrate"]		= 50;
statmap[? "critdmg"]		= 150;
statmap[? "finaldmg"]		= 100;
statmap[? "finalshld"]		= 0;
statmap[? "blkmod"]			= 50;

ds_map_copy(basestatmap, statmap);

// Initial Variables
destX = x;
destY = y;
canMove = true;
highRegenThreshold = 0;
canAttack = true;
canUseSkill = true;
isCCed = false;
isDead = false;
isMoving = false;
isBlocking = false;

cd = array_create(21,0);
maxcd = array_create(21,0);
atkTimer = 0;
statChange = true;


buff = ds_list_create();

// Ally HP Bar
var minihp = instance_create_layer(x, y, "dmgTxt", obj_allyhpbar);
minihp.hpwidth	= sprite_width;
minihp.target	= id;

