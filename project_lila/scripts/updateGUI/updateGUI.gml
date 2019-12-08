switch(global.gui_state){
	case -1:
		exit;
		break;
	
	case 0:
		// Clean up existing gui elements
		instance_destroy(obj_item_inv);
		instance_destroy(obj_text_inv);
		instance_destroy(obj_context_menu);
		instance_destroy(obj_context_menu_button);
		
		// Make gui elements
		for(var i = 0; i < 12; ++i){
			if(global.player.equips[i] > 0){
				var item = instance_create_layer(camera_get_view_x(global.currentCamera)+global.equipItemBox[i,0],
												camera_get_view_y(global.currentCamera)+global.equipItemBox[i,1],
												"GUI",obj_item_inv);
				item.type = item.EQUIP;
				item.itemid = global.player.equips[i];
				item.sprite_index = asset_get_index(ds_map_find_value(global.itemData[| global.player.equips[i]],"sprite"));
			}
		}

		var invSpace = 0;
		for(var i = 0; i < ds_list_size(global.itemData); ++i){
			if(invSpace > 99){exit;}
			if(global.playerItems[i] > 0){
				var item = instance_create_layer(camera_get_view_x(global.currentCamera)+global.invItemBox[invSpace,0],
												camera_get_view_y(global.currentCamera)+global.invItemBox[invSpace,1],
												"GUI",obj_item_inv);
				item.type = item.INVEN;
				item.sprite_index = asset_get_index(ds_map_find_value(global.itemData[| i],"sprite"));
				item.itemid = i;
		
				var text = instance_create_layer(item.x,item.y,"GUIText",obj_text_inv);
				text.anchor = item;
		
				invSpace++;
			}
		}
		break;
}


