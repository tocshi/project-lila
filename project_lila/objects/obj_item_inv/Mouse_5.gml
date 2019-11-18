/// @description Clear previous context menu and create a new one
with (obj_context_menu) {instance_destroy();}
with (obj_context_menu_button) {instance_destroy();}
show_debug_message("Item Id at item slot: " + string(itemid));
var context_menu = instance_create_layer(mouse_x, mouse_y, "GUIPopUp", obj_context_menu);
context_menu.itemid = itemid;
context_menu.isEquipped	= type == EQUIP;

button = instance_create_layer(x, y, "GUIPopUp", obj_context_menu_button);
instance_deactivate_object(button);

if (type == EQUIP) {
	ds_list_add(context_menu.buttons, button.UNEQUIP);
} else {
	if (ds_map_find_value(global.itemData[| itemid], "type") == "equippable") {
		ds_list_add(context_menu.buttons, button.EQUIP);
	}
	if (ds_map_find_value(global.itemData[| itemid], "type") == "consumable") {
		ds_list_add(context_menu.buttons, button.USE);
	}
}
if (ds_map_find_value(global.itemData[| itemid], "value") >= 0) {
	ds_list_add(context_menu.buttons, button.DROP);
}
instance_destroy(button);

context_menu.alarm[0] = 1;