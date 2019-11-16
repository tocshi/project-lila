/// @description Do button action
switch (type) {
	case EQUIP:
		equipItem(global.player, itemid); break;
	case UNEQUIP:
		unequipItem(global.player, itemid); break;
	case USE:
		// TODO: Implement item usage
	case DROP:
		dropItem(global.player.x, global.player.y, itemid, isEquipped, global.player); break;
}
updateGUI();