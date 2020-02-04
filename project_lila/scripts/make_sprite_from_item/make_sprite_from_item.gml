var itemid = argument0;

var sprite = sprite_duplicate(asset_get_index(ds_map_find_value(global.itemData[| itemid],"sprite")));
sprite_collision_mask(sprite,true,0,0,0,sprite_get_width(sprite),sprite_get_height(sprite),bboxkind_precise,0);

// enclose in another switch statement for unique weapons? maybe? wtf am i doing nested switch statements
switch(ds_map_find_value(global.itemData[| itemid],"category")){
	case "Longsword":
	case "Knife":
		sprite_set_offset(sprite,7,56);
		break;
	case "Bow":
		sprite_set_offset(sprite,15,48);
		break;
	case "Spellbook":
		sprite_set_offset(sprite,7,56);
		break;
	case "Chain Knife":
		sprite_set_offset(sprite,15,32);
		break;
	default:
	return false;
}

sprite_set_speed(sprite,0,spritespeed_framespersecond);
return sprite;