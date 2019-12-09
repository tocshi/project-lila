// universal unit for 1 "meter" of distance
global.meter = 32;
// Is the game paused?
global.pause = 0;
// Which menu to access when paused.
global.gui_state = 0;
// Whether the cursor is holding over an item in inventory
global.holding = false;
// Whether an item is currently being dragged
global.dragging = false;
// Player id
global.player = 0;

// Item data parsing function
itemDataFile = file_text_open_read("item_data.json");
var itemDataStr = "";
while(!file_text_eof(itemDataFile)){
	itemDataStr += file_text_read_string(itemDataFile);
	file_text_readln(itemDataFile);
}
file_text_close(itemDataFile);

var itemDataJson = json_decode(itemDataStr);
global.itemData = ds_map_find_value(itemDataJson, "default");

// Player inventory array and item quantity array
global.playerInv = array_create(100, 0);
global.playerItems = array_create(ds_list_size(global.itemData),0);

// Equipment pixel positions
global.equipItemBox = array_create(12,[0,0]);
for(var i = 0; i < 4; i++){
	for(var j = 0; j < 3; j++){
		//absolute x and y positions
		global.equipItemBox[(i * 3) + j,0] = 198 + j*86;
		global.equipItemBox[(i * 3) + j,1] = 119 + i*86;
	}
}
// Inventory pixel positions
global.invItemBox = array_create(100,[0,0]);
for(var i = 0; i < 10; i++){
	for(var j = 0; j < 10; j++){
		//absolute x and y positions
		global.invItemBox[(i * 10) + j,0] = 490 + j*66;
		global.invItemBox[(i * 10) + j,1] = 121 + i*66;
	}
}
// Item Hotbar pixel positions
global.itemBarBox = array_create(10,[0,0]);
for(var i = 0; i < 10; i++){
	global.itemBarBox[i,0] = 2;
	global.itemBarBox[i,1] = 121 + i*66;
}
// Buffbar pixel positions
global.buffBarBox = array_create(20,[0,0]);
for(var i = 0; i < 20; i++){
	global.buffBarBox[i,0] = 74;
	global.buffBarBox[i,1] = 121 + i*33;
}

// for skills and buff bar
global.hpmpend = 440;

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