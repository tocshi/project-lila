global.meter = 32;
global.pause = 0;
gui_state = 0;

global.itemData = array_create(2048, ds_map_create());

// Stats that equipped items are allowed to change
global.equipStats = ds_list_create();
ds_list_add(equipStats,
	"atk",
	"def",
	"maxhp",
	"hpregen",
	"maxmp",
	"mpregen",
	"fire_atk",
	"ice_atk",
	"lightning_atk",
	"earth_atk",
	"wind_atk",
	"light_atk",
	"dark_atk",
	"fire_def",
	"ice_def",
	"lightning_def",
	"earth_def",
	"wind_def",
	"light_def",
	"dark_def",
	"movespeed",
	"atkspeed",
	"critrate",
	"critdmg",
	"finaldmg",
	"finalshld",
	"blkmod");

cursor_sprite = spr_cursor;