/// @description Add item by id. Defaults to first available slot if slot not specified.
/// @param item_id The id of the item from the item list
/// @param target_slot (Optional) The target slot to add the item to

var itemid = argument[0]
global.playerItems[itemid]++;

if(argument_count > 1) { // target slot is specified
	var target_slot = argument[1];
	if (global.playerItems[itemid] <= 1) {	// if item did not previously exist in inventory
		if (global.playerInv[target_slot] == 0 || global.playerInv == itemid) { // if target slot is available
			// make target slot display item
			global.playerInv[target_slot] = itemid;
		} else { // use first unoccupied slot if target slot is unavailable
			for (var i=0; i < array_length_1d(global.playerInv); i++) { // search for first available slot 
				if (global.playerInv[i] == 0) {
					// make slot display item
					global.playerInv[i] = itemid;
					break;
				}
			}
		}
	}
} else {
	if (global.playerItems[itemid] <= 1) { // if item did not previously exist in inventory
		for (var i=0; i < array_length_1d(global.playerInv); i++) { // search for first available slot 
			if (global.playerInv[i] == 0) {
				// make slot display item
				global.playerInv[i] = itemid;
				break;
			}
		}
	}
}
updateGUI();