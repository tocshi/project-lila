global.player = self.id;
global.currentCamera = camera_create_view(x-800,y-450,1600,900,0,self.id,100,100,800,450);
view_set_camera(view_current,global.currentCamera);
view_set_wport(view_current,1600);
view_set_hport(view_current,900);
view_set_visible(view_current,true);

depth = depth-1;

// Name and Dialogue
name = "Player Name"
portrait_sprite = spr_empty;
voice_sound = 0;

// Stats
statmap = ds_map_create();
basestatmap = ds_map_create();

statmap[? "level"] 			= 10;
statmap[? "xp"] 			= 0;
statmap[? "cpp"]			= 0;
statmap[? "class"]			= "Debug";
statmap[? "classlvl"]		= 10;
statmap[? "classxp"] 		= 0;
statmap[? "maxhp"]			= 100 + statmap[? "level"]*10 + round(sqr(statmap[? "level"])/10);
statmap[? "hp"]				= statmap[? "maxhp"];
statmap[? "hpshield"]		= 0;
statmap[? "hpregen"]		= statmap[? "maxhp"]/100/60;//0.02 + statmap[? "level"]*0.002;
statmap[? "maxmp"]			= 100;
statmap[? "mp"]				= statmap[? "maxmp"];
statmap[? "mpregen"]		= 0.01666*10; //doubled if canMove && !isMoving
statmap[? "atk"]			= 50;
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
statmap[? "atkspeed"]		= 1.2;
statmap[? "critrate"]		= 25;
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
alpha = 1;

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
skill_button[1]		= global.key_skill0;
skill_button[2]		= global.key_skill1;
skill_button[3]		= global.key_skill2;
skill_button[4]		= global.key_skill3;
skill_button[5]		= global.key_skill4;
skill_button[6]		= global.key_skill5;
skill_button[7]		= global.key_skill6;
skill_button[8]		= global.key_skill7;
skill_button[9]		= global.key_skill8;
skill_button[10]	= global.key_skill9;
// item actives
skill_button[11]	= global.key_item0;
skill_button[12]	= global.key_item1;
skill_button[13]	= global.key_item2;
skill_button[14]	= global.key_item3;
skill_button[15]	= global.key_item4;
skill_button[16]	= global.key_item5;
skill_button[17]	= global.key_item6;
skill_button[18]	= global.key_item7;
skill_button[19]	= global.key_item8;
skill_button[20]	= global.key_item9;

//debug
inftoggle = 0;

itemBar[0] = 22;
itemBar[1] = 1;
itemBar[2] = 2;
itemBar[3] = 3;
if(global.playerItems[1] > 0){exit;}
repeat(20){
	addItem(1);
}
addItem(6);
addItem(7);
addItem(8);
addItem(9);
addItem(10);
addItem(11);
addItem(16);
addItem(18);
addItem(34);



