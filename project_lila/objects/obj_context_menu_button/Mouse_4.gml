/// @description Do button action
switch (type) {
	case EQUIP:
		equipItem(global.player, itemid);
		updateGUI();
		break;
	case UNEQUIP:
		unequipItem(global.player, itemid);
		updateGUI();
		break;
	case USE:
		useItem(global.player,itemid); 
		updateGUI(); 
		break;
	case DROP:
		confirmation_menu(
			create_function_pointer_list(
				create_function_pointer(dropItem, global.player.x, global.player.y, itemid, isEquipped, global.player),
				create_function_pointer(destroy_instances_by_type, obj_confirmation_menu, obj_generic_btn),
				create_function_pointer(updateGUI)
			), 
			create_function_pointer_list(
				create_function_pointer(destroy_instances_by_type, obj_confirmation_menu, obj_generic_btn),
				create_function_pointer(updateGUI)
			),
			"Are you sure you want to drop this item?"
		); 
		break;
	case MOVE:
		with (instance_create_layer(x, y, "GUIPopup", obj_item_dragging)) {
			sprite_index = other.item_sprite_index;
			itemid = other.itemid;
			origin_type = other.item_type;
			origin_instance = other.item;
			origin_slot = findArrayIndex(global.playerInv, itemid);
			isDrag = false;
			delay = 10;
		}
		break;
}
//test