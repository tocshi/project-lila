global.meter = 32;
global.pause = 0;
gui_state = 0;

//global.itemData = array_create(32000, ds_map_create());
itemDataFile = file_text_open_read("/datafiles/item_data.json");
var itemDataStr = "";
while(!file_text_eof(itemDataFile)){
	itemDataStr += file_text_read_string(itemDataFile);
	file_text_readln(itemDataFile);
}
file_text_close(itemDataFile);

var itemDataJson = json_decode(itemDataStr);
global.itemData = ds_map_find_value(itemDataJson, "default");


// Stats that equipped items are allowed to change
global.equipStats = ds_list_create();
ds_list_add(global.equipStats,
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