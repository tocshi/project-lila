buttonY = y;
for(i = each(buttons, ds_type_list); as(); iterate()) {
	button = instance_create_layer(x, buttonY, "GUIText", obj_context_menu_button);
	button.type = _val();
	button.itemid = itemid;
	buttonY += button.height;
}