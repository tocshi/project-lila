/// @description Do button action
switch (type) {
	case EQUIP:
		equipItem(global.player, itemid); break;
	case UNEQUIP:
		unequipItem(global.player, itemid); break;
	case USE:
		useItem(global.player,itemid); break;
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
		); break;
}
updateGUI();
//test