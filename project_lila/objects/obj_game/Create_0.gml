// universal unit for 1 "meter" of distance and game size
global.meter = 32;
global.game_width = 1600;
global.game_height = 900;
// Is the game paused?
global.pause = 0;
// Player id
global.player = noone;
// Player Last Used Class
global.lastClass = obj_class_knight;

// Which menu to access when paused.
global.gui_state = -1;
// Whether the cursor is holding over an item in inventory
global.holding = false;
// Whether an item is currently being dragged
global.dragging = false;
// Whether an item is currently being hovered over. -1 for no item.
global.inv_item_hover = -1;
global.inv_item_preview_lock = -1;

global.cursor_state = 0;

// KEYBOARD SETTINGS
global.key_interact =	vk_enter;
global.mouse_interact =	mb_left;
global.key_up =			ord("W");
global.key_left =		ord("A");
global.key_down =		ord("S");
global.key_right =		ord("D");

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

// Player class level & equip loadouts
global.playerEquipLoadouts = ds_map_create();
global.playerClassExp = ds_map_create();

// Equipment pixel positions
global.equipItemBox = array_create(12,[0,0]);
for(var i = 0; i < 4; ++i){
	for(var j = 0; j < 3; j++){
		//absolute x and y positions
		global.equipItemBox[(i * 3) + j,0] = 198 + j*86;
		global.equipItemBox[(i * 3) + j,1] = 119 + i*86;
	}
}
// Inventory pixel positions
global.invItemBox = array_create(100,[0,0]);
for(var i = 0; i < 10; ++i){
	for(var j = 0; j < 10; j++){
		//absolute x and y positions
		global.invItemBox[(i * 10) + j,0] = 490 + j*66;
		global.invItemBox[(i * 10) + j,1] = 121 + i*66;
	}
}
// Stat Display pixel positions
invStatLocation = array_create(24,[0,0]);
for(var i = 0; i < 12; ++i){
	for(var j = 0; j < 2; j++){
		//absolute x and y positions
		/*
		var x0 = 196;
		var y0 = 466;
		var x_inc = 120;
		var y_inc = 24;*/
		invStatLocation[(i * 2) + j,0] = 206 + j*120;
		invStatLocation[(i * 2) + j,1] = 476 + i*25;
	}
}
// Item Hotbar pixel positions
global.itemBarBox = array_create(10,[0,0]);
for(var i = 0; i < 10; ++i){
	global.itemBarBox[i,0] = 2;
	global.itemBarBox[i,1] = 121 + i*66;
}
// Buffbar pixel positions
global.buffBarBox = array_create(20,[0,0]);
for(var i = 0; i < 20; ++i){
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
	"hpregen",
	"mpregen",
	"atkspeed",
	"movespeed",
	"critrate",
	"critdmg",
	"fire_atk",
	"fire_def",
	"ice_atk",
	"ice_def",
	"lightning_atk",
	"lightning_def",
	"earth_atk",
	"earth_def",
	"wind_atk",
	"wind_def",
	"light_atk",
	"light_def",
	"dark_atk",
	"dark_def",
	"finaldmg",
	"finalshld",
	"maxhp",
	"maxmp",
	"blkmod");

console = noone;

// gui variables
item_desc_line_length = 28;
item_desc_lines = ds_list_create();
display_set_gui_size(1600,900);