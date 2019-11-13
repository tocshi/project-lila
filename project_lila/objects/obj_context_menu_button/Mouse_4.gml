show_debug_message("Item Id at button: " + string(itemid))
switch (type) {
	case EQUIP:
		equipItem(global.player, itemid); break;
	case UNEQUIP:
		unequipItem(global.player, itemid); break;
	case USE:
		// TODO: Implement item usage
	case DROP:
		// TODO: Implement item dropping

}