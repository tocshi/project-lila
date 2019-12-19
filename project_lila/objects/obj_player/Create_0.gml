global.player = self.id;
global.currentCamera = camera_create_view(800,450,1600,900,0,self.id,100,100,640,360);
view_set_camera(view_current,global.currentCamera);
view_set_wport(view_current,1600);
view_set_hport(view_current,900);
view_set_visible(view_current,true);

// Stats
statmap = ds_map_create();
basestatmap = ds_map_create();

statmap[? "level"] 			= 0;
statmap[? "xp"] 			= 0;
statmap[? "class"]			= "Debug";
statmap[? "classlvl"]		= 10;
statmap[? "classxp"] 		= 0;
statmap[? "maxhp"]			= 100 + statmap[? "level"]*10 + round(sqr(statmap[? "level"])/10);
statmap[? "hp"]				= statmap[? "maxhp"];
statmap[? "hpshield"]		= 0;
statmap[? "hpregen"]		= statmap[? "maxhp"]/100/60;//0.02 + statmap[? "level"]*0.002;
statmap[? "maxmp"]			= 100;
statmap[? "mp"]				= 100;
statmap[? "mpregen"]		= 0.01666*10; //doubled if canMove && !isMoving
statmap[? "atk"]			= 0;
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

essence						= 0;
unleashGauge				= 0;

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
statChange = true;
equipApplied = false;

cd = array_create(21,0);
maxcd = array_create(21,0);
itemcd = array_create(ds_list_size(global.itemData),0);
atkTimer = 0;

// buff list and visible buff list creation 
buff = ds_list_create();
visBuff = ds_list_create();

equips = array_create(12, 0);
itemBar = array_create(10, 0);

skill_button = array_create(21,"");

// Set default keybinds
skill_button[0]		= vk_space;
// class skills
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
// item actives
skill_button[11]	= ord("1");
skill_button[12]	= ord("2");
skill_button[13]	= ord("3");
skill_button[14]	= ord("4");
skill_button[15]	= ord("5");
skill_button[16]	= ord("6");
skill_button[17]	= ord("7");
skill_button[18]	= ord("8");
skill_button[19]	= ord("9");
skill_button[20]	= ord("0");

//debug
infmp = false;

equips[0] = 10;
equips[1] = 6;
equips[4] = 7;
equips[7] = 8;
equips[10] = 9;
itemBar[0] = 22;
itemBar[1] = 1;

global.playerItems[1]+=20;
if (findArrayIndex(global.playerInv, 1) == -1) {
	for (var i=0; i < array_length_1d(global.playerInv); i++) {
		if (global.playerInv[i] == 0) {
			global.playerInv[i] = 1;
			break;
		}
	}
}
global.playerItems[22]++;
if (findArrayIndex(global.playerInv, 22) == -1) {
	for (var i=0; i < array_length_1d(global.playerInv); i++) {
		if (global.playerInv[i] == 0) {
			global.playerInv[i] = 22;
			break;
		}
	}
}

