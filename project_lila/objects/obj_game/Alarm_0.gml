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

var invSpace = 0;
for(var i = 0; i < ds_list_size(global.itemData); i++){
	if(invSpace > 99){exit;}
	if(global.playerItems[i] > 0){
		//show_debug_message(camera_get_view_x(global.currentCamera)+global.invItemBox[invSpace,0]);
		//show_debug_message(camera_get_view_y(global.currentCamera)+global.invItemBox[invSpace,1]);
		var item = instance_create_layer(camera_get_view_x(global.currentCamera)+global.invItemBox[invSpace,0],
										camera_get_view_y(global.currentCamera)+global.invItemBox[invSpace,1],
										"GUI",obj_item_inv);
		instance_activate_object(item);
		item.sprite_index = asset_get_index(ds_map_find_value(global.itemData[| i],"sprite"));
		
		draw_set_halign(fa_left);
		draw_set_valign(fa_top);
		draw_set_color(c_black);
		draw_set_alpha(1);
		draw_set_font(fnt_dmgtxt);
		draw_text(camera_get_view_x(global.currentCamera)+global.invItemBox[invSpace,0],
				camera_get_view_y(global.currentCamera)+global.invItemBox[invSpace,1],
				string(global.playerItems[i]));
		
		invSpace++;
	}
}