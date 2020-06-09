/// @description Update hotbar items

instance_destroy(obj_item_hotbar);

for(var i = 0; i < array_length_1d(global.player.itemBar); ++i){
	var xx = global.itemBarBox[i,0];
	var yy = global.itemBarBox[i,1];
	var itemid = global.player.itemBar[i];
	
	if(itemid > 0){
		var item = instance_create_layer(camera_get_view_x(global.currentCamera)+xx,
										camera_get_view_y(global.currentCamera)+yy,
										"HUD",obj_item_hotbar);
		item.type = item.HOTBAR;
		item.sprite_index = asset_get_index(ds_map_find_value(global.itemData[| itemid],"sprite"));
		item.itemid = itemid;
		item.hotbar_slot = i;
	}
}