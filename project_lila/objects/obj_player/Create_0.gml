// Stats
level			= 0;
maxhp			= 100 + level*10 + round(sqr(level)/10);
hp				= 100 + level*10 + round(sqr(level)/10);
hpshield		= 0;
hpregen			= 0.02 + level*0.002;
maxmp			= 100;
mp				= 100;
mpregen			= 0.1666; //doubled if canMove && !isMoving
atk				= 10;
def				= 0;

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
critrate		= 0;
critdmg			= 150;
finaldmg		= 100;
finalshld		= 0;


// Initial Variables
destX = 0;
destY = 0;
canMove = true;
highRegenThreshold = 0;
//canAttack = true;
isMoving = false;

cd = array_create(21,0);

// buff array properties:
//	0	time
//	1	visible (on buff bar)
//	2	name
//	3	countdownEvent
//	4	unremovable
buff = ds_list_create();
// list of buffs to remove from timer ending (change to different ds later?)
buffRemoved = false;

skill_button = array_create(11,"");

// Set default keybinds
skill_button[0]		= vk_space;
skill_button[1]		= ord("Q");
skill_button[2]		= ord("W");
skill_button[3]		= ord("E");
skill_button[4]		= ord("R");
skill_button[5]		= ord("T");
skill_button[6]		= ord("A");
skill_button[7]		= ord("S");
skill_button[8]		= ord("D");
skill_button[9]		= ord("F");
skill_button[10]	= ord("G");

