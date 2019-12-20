var target = argument0;
var class = argument1;

if(!instance_exists(target)){exit;}
if(target.statmap[? "class"] == class){exit;}

var xx = target.x;
var yy = target.y;
var prevclass = target.statmap[? "class"];
var level = target.statmap[? "level"];
var xp = target.statmap[? "xp"];
var hp = target.statmap[? "hp"];
var mp = target.statmap[? "mp"];

switch(class){
	case "Knight":
		var classobj = obj_class_knight;
		break;
	
	case "Archer":
		var classobj = obj_class_archer;
		break;
	
	case "Mage":
		var classobj = obj_class_mage;
		break;
	
	default:
	show_error("Switching to an unlisted class!",true);
}

// unequips all items if it's the player
if(target == global.player){
	if(!ds_map_exists(global.playerEquipLoadouts,prevclass)){global.playerEquipLoadouts[? prevclass] = array_create(array_length_1d(target.equips));}
	for(var i = 0; i < array_length_1d(target.equips); ++i){
		if(target.equips[i] > 0){
			array_set(global.playerEquipLoadouts[? prevclass],i,target.equips[i]);
			unequipItem(target,target.equips[i]);
		}
	}
}
camera_set_view_target(global.currentCamera,noone);
camera_destroy(global.currentCamera);
instance_destroy(obj_player_move_indicator);
with(all){
	if(variable_instance_exists(self,"user")){
		if(user == global.player){instance_destroy();}
	}
}
instance_destroy(target);

with(instance_create_layer(xx,yy,"Instances",classobj)){
	if(ds_map_exists(global.playerEquipLoadouts,class)){
		for(var i = 0; i < array_length_1d(equips); ++i){
			if(array_get(global.playerEquipLoadouts[? class],i) > 0){
				equipItem(global.player,array_get(global.playerEquipLoadouts[? class],i));
			}
		}
	}
	statmap[? "level"] = level;
	statmap[? "xp"] = xp;
	statmap[? "hp"] = hp;
	statmap[? "mp"] = mp;
}