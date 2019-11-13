show_debug_message("Item Id at button: " + string(itemid))
switch (type) {
	case EQUIP:
		equipItem(global.player, itemid);
	case UNEQUIP:
		unequipItem(global.player, itemid);
	case USE:
		// TODO: Implement item usage
	case DROP:
		// TODO: Implement item dropping

}