/// @description Add items by id. Defaults to first available slot if slot not specified.
/// @param item_id The id of the item from the item list
/// @param num_items Number of items to add
/// @param target_slot (Optional) The target slot to add the item to

var itemid = argument0;
var num_items = argument1;

if (argument_count > 2) {
	var target_slot = argument2;
	for (var i = 0; i < num_items; ++i) {
		addItem(itemid, target_slot);	
	}
} else {
	for (var i = 0; i < num_items; ++i) {
		addItem(itemid);	
	}
}