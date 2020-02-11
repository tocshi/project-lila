/// @description Safely remove an item from the inventory.
/// @param itemid The id of the item to remove.
/// @param isEquipped Whether or not the weapon is equipped.
/// @param target The entity to execute this script on.

var itemid = argument0;
var isEquipped = argument1;
var target = argument2;


if (target != global.player) {
	// TODO: implement?
	exit;
}

if (isEquipped && target.equips[getEquipSlot(itemid)] == 0) {
	exit;
}
if (!isEquipped && global.playerItems[itemid] <= 0) {
	exit;	
}

if (isEquipped) {
	unequipItem(target, itemid);	
}

global.playerItems[itemid]--;
if (global.playerItems[itemid] <= 0) {
	global.playerInv[findArrayIndex(global.playerInv, itemid)] = 0;
}