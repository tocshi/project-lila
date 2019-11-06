instance_deactivate_all(true);
screen_save(working_directory + "temp\paused_state.png");
paused_state = sprite_add(working_directory + "temp\paused_state.png",1,false,false,0,0);
cursor_sprite = spr_cursor;
global.pause = true;

for(var i = 0; i < 12; i++){
	if(global.player.equips[i] > 0){
		var item = instance_create_layer(camera_get_view_x(global.currentCamera)+global.equipItemBox[i,0],
										camera_get_view_y(global.currentCamera)+global.equipItemBox[i,1],
										"GUI",obj_item_inv);
		instance_activate_object(item);
		item.sprite_index = asset_get_index(ds_map_find_value(global.itemData[| global.player.equips[i]],"sprite"));
		//show_debug_message(string(camera_get_view_x(global.currentCamera)+global.equipItemBox[i,0]) + "," + string(camera_get_view_y(global.currentCamera)+global.equipItemBox[i,1]));
	}
}