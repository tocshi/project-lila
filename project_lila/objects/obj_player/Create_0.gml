// Stats
hp				= 100;
mp				= 100;
atk				= 10;
def				= 10;
fire_atk		= 0;
ice_atk			= 0;
lightning_atk	= 0;
earth_atk		= 0;
wind_atk		= 0;
light_atk		= 0;
dark_atk		= 0;
fire_def		= 0;
ice_def			= 0;
lightning_def	= 0;
earth_def		= 0;
wind_def		= 0;
light_def		= 0;
dark_def		= 0;
movespeed		= 3;
atkspeed		= 2;

// Initial Variables
destX = 0;
destY = 0;
canMove = true;
//canAttack = true;
isMoving = false;

onCD = array_create(11,false);

//var cam = camera_create_view(0, 0, 1600, 900, 0, obj_player, 5, 5, -1, -1);
//view_set_camera(0, cam);
//camera_set_view_target(cam, obj_player);