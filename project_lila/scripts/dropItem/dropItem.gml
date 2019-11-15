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

dropItemAtRate(xx, yy, itemid, 1000)
