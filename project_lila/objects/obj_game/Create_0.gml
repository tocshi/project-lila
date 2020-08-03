// GAME VERSION
version = "0.0.8.1"
// Is the game paused?
global.pause = 0;
// Player id
global.player = noone;
// Player Last Used Class
global.lastClass = obj_class_knight;
// Player Last Entered Room
global.lastDoor = "";
global.lastRoom = rm_tutorial0;
// Player Permanent Stats
global.playerSavedStats = ds_map_create();
global.playerSavedBuffs = ds_list_create();

// Which menu to access when paused.
global.gui_state = -1;
lastgui = 1;
// Whether the cursor is holding over an item in inventory
global.holding = false;
// Whether an item is currently being dragged
global.dragging = false;
// Whether an item is currently being hovered over. -1 for no item.
global.inv_item_hover = -1;
global.inv_item_preview_lock = -1;
// Whether a skill is currently being hovered over. "" for no skill.
// Sets skill unlock button to display info
global.inv_skill_hover = "";
global.inv_skill_preview_lock = "";
global.skill_unlock_button = "";

// cursor state
global.cursor_state = 0;

// CONTROLS STATE: 0 = MOUSEMOVEMENT, 1 = KEYBOARDMOVEMENT, 2 = GAMEPAD???
global.controls_state = 0;

// KEYBOARD SETTINGS
global.movement_mode = 0; // 0 = mouse movement, 1 = directional movement
global.key_interact =	vk_enter;
global.mouse_interact =	mb_left;
global.key_console =	[191, 191];
global.key_up =			[ord("W"), ord("W")];
global.key_left =		[ord("A"), ord("A")];
global.key_down =		[ord("S"), ord("S")];
global.key_right =		[ord("D"), ord("D")];
global.key_skill0 =		[ord("Q"), ord("Q")];
global.key_skill1 =		[ord("W"), ord("E")];
global.key_skill2 =		[ord("E"), ord("R")];
global.key_skill3 =		[ord("R"), ord("F")];
global.key_skill4 =		[ord("A"), ord("Z")];
global.key_skill5 =		[ord("S"), ord("X")];
global.key_skill6 =		[ord("D"), ord("C")];
global.key_skill7 =		[ord("F"), ord("V")];
global.key_item0 =		[ord("1"), ord("1")];
global.key_item1 =		[ord("2"), ord("2")];
global.key_item2 =		[ord("3"), ord("3")];
global.key_item3 =		[ord("4"), ord("4")];
global.key_item4 =		[ord("5"), ord("5")];
global.key_item5 =		[ord("6"), ord("6")];
global.key_item6 =		[ord("7"), ord("7")];
global.key_item7 =		[ord("8"), ord("8")];
global.key_item8 =		[ord("9"), ord("9")];
global.key_item9 =		[ord("0"), ord("0")];

// Parse Json Data
var itemDataJson = parse_json_to_str("item_data.json");
global.itemData = ds_map_find_value(itemDataJson, "default");
var skillDataJson = parse_json_to_str("skill_data.json");
global.skillData = ds_map_find_value(skillDataJson, "default");

// Player inventory array and item quantity array
global.playerInv = array_create(100, 0);
global.playerItems = array_create(ds_list_size(global.itemData),0);

// Player class data & equip & loadouts
global.playerEquipLoadouts = ds_map_create();
global.playerItemBarLoadouts = ds_map_create();
global.playerSkillLoadouts = ds_map_create();

//-----------------
//   CONSTANTS
//-----------------

// universal unit for 1 "meter" of distance and game size
global.meter = 32;
global.game_width = 1600;
global.game_height = 900;

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
	for(var j = 0; j < 2; ++j){
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

// Equipped Skills pixel positions
global.equippedSkillBox = array_create(8,[0,0]);
for(var i = 0; i < 8; ++i){
	global.equippedSkillBox[i,0] = 179 + i*86;
	global.equippedSkillBox[i,1] = 454;
}

// Available Skills pixel positions
global.availableSkillBox = array_create(24,[0,0]);
for(var i = 0; i < 3; ++i){
	for(var j = 0; j < 8; ++j){
		global.availableSkillBox[(i * 8) + j,0] = 179 + j*86;
		global.availableSkillBox[(i * 8) + j,1] = 554 + i*86;
	}
}

// for skills and buff bar
global.hpmpend = 540;

// List of all the classes
global.classList = [
	"Knight",
	"Archer",
	"Mage",
	"Rogue"];
	
// Map of classes and items categories they can equip
global.weaponClassMap = ds_map_create();
ds_map_add(global.weaponClassMap, "Longsword", initialize_array("Knight"));
ds_map_add(global.weaponClassMap, "Bow", initialize_array("Archer"));
ds_map_add(global.weaponClassMap, "Spellbook", initialize_array("Mage"));
ds_map_add(global.weaponClassMap, "Knife", initialize_array("Rogue"));
ds_map_add(global.weaponClassMap, "Chain Knife", initialize_array("Rogue"));

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

// Keybinds that show up in options menu
global.options_keys = [
	"key_console",
	"key_skill0",
	"key_skill1",
	"key_skill2",
	"key_skill3",
	"key_skill4",
	"key_skill5",
	"key_skill6",
	"key_skill7",
	"key_item0",
	"key_item1",
	"key_item2",
	"key_item3",
	"key_item4",
	"key_item5",
	"key_item6",
	"key_item7",
	"key_item8",
	"key_item9",
];

// Additional keybinds that show up if using key movement
global.options_directional_keys = [
	"key_up",
	"key_down",
	"key_left",
	"key_right",
];

global.console = noone;

// gui variables
item_desc_line_length = 28;
item_desc_lines = ds_list_create();
skill_desc_line_length = 42;
skill_desc_lines = ds_list_create();
display_set_gui_size(1600,900);

// Class Proficiency Points map
global.playerCPP = ds_map_create();
for(var i = 0; i < array_length_1d(global.classList); ++i){
	ds_map_add(global.playerCPP, global.classList[i], 0);
}

// Player total exp and level
global.playerXP = 0;
global.playerLevel = 0;

// Notify User-defined events
enum notify_event {
	damage = 15,
	heal = 14
}