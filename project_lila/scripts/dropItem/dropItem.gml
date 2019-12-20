var xx = argument0;
var yy = argument1;
var itemid = argument2;
var isEquipped = argument3;
var target = argument4;


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

dropItemAtRate(xx, yy, itemid, 1000);