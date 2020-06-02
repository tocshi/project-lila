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
	
	case "Rogue":
		var classobj = obj_class_rogue;
		break;
	
	default:
	return false;
}

// unequips all items if it's the player
if(target == global.player){
	if(!ds_map_exists(global.playerEquipLoadouts,prevclass)){global.playerEquipLoadouts[? prevclass] = array_create(array_length_1d(target.equips));}
	if(!ds_map_exists(global.playerItemBarLoadouts,prevclass)){global.playerItemBarLoadouts[? prevclass] = array_create(array_length_1d(target.itemBar));}
	for(var i = 0; i < array_length_1d(target.equips); ++i){
		if(target.equips[i] > 0){
			array_set(global.playerEquipLoadouts[? prevclass],i,target.equips[i]);
			unequipItem(target,target.equips[i]);
		}
	}
	for(var i = 0; i < array_length_1d(target.itemBar); ++i){
		if(target.itemBar[i] > 0){
			array_set(global.playerItemBarLoadouts[? prevclass],i,target.itemBar[i]);
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
	restore_player_equips();
	statmap[? "level"] = level;
	statmap[? "xp"] = xp;
	statmap[? "hp"] = hp;
	statmap[? "mp"] = mp;
}
return true;