if(global.pause){
	var x0 = camera_get_view_x(global.currentCamera);
	var y0 = camera_get_view_y(global.currentCamera);
	switch(global.gui_state){
		case 0:
		draw_set_alpha(1);
		draw_sprite(gui_inv,-1,x0,y0);
		// draw stats
		draw_set_font(fnt_gui_small);
		for(var i = 0; i < 24; ++i){
			var xx = x0 + invStatLocation[i,0];
			var yy = y0 + invStatLocation[i,1];
			var spr_stat = spr_stat_atk + i;
			draw_sprite(spr_stat,-1,xx,yy);
			draw_set_halign(fa_left);
			draw_set_valign(fa_top);
			draw_set_color(c_black);
			if(global.equipStats[| i] == "hpregen" || global.equipStats[| i] == "mpregen"){
				draw_text(xx,yy-4, "   " + string(room_speed*global.player.statmap[? global.equipStats[| i]]));
			}
			else{draw_text(xx,yy-4, "   " + string(global.player.statmap[? global.equipStats[| i]]));}		
		}
	
		// check for hover
		if(instance_position(mouse_x,mouse_y,obj_item_inv) != noone){
			global.inv_item_hover = instance_position(mouse_x,mouse_y,obj_item_inv).itemid;
		}
		else{global.inv_item_hover = -1;}
		
		// draw item preview
		if(global.inv_item_hover >= 0){
			// draw item name
			draw_set_halign(fa_left);
			draw_set_valign(fa_top);
			draw_set_font(fnt_gui_medium);
			var item_name = ds_map_find_value(global.itemData[| global.inv_item_hover],"name");
			var width_scale = min(1,16/string_length(item_name));
			draw_text_outlined_transformed(x0+1190,y0+123,c_black,c_white,item_name,width_scale,1,0);
			// draw item image
			draw_sprite_ext(asset_get_index(ds_map_find_value(global.itemData[| global.inv_item_hover],"sprite")),0,x0+1208,y0+222,3,3,0,c_white,1);
			// draw item description
			draw_set_font(fnt_gui_small);
			draw_set_color(c_black);
			// Trim characters past item_desc_line_length chars
			ds_list_clear(item_desc_lines);
			item_desc_lines[| 0] = ds_map_find_value(global.itemData[| global.inv_item_hover],"desc");
			for (var i = 0; i < ds_list_size(item_desc_lines); i++) {
				var str = item_desc_lines[| i];
				if (string_length(str) > item_desc_line_length) {
					// line separaration logic
					var cutoff = item_desc_line_length;
					for(var j = item_desc_line_length; j >=0; --j){
						if(string_char_at(str,j) == " " || string_char_at(str,j) == "-"){
							cutoff = j;
							break;
						}
					}
					var left = string_copy(str, 1, cutoff);
					var right = string_copy(str, cutoff + 1, string_length(str) - cutoff);
					item_desc_lines[| i] = left;
					ds_list_insert(item_desc_lines, i + 1, right);
				}
			}
			// draw the actual text
			var y_offset = 0;
			for (var i = 0; i < ds_list_size(item_desc_lines); ++i) {
				draw_text(x0+1187, y0+466+y_offset, item_desc_lines[| i]);
				y_offset += 20;
			}
		}
		break;
	}
}

draw_set_color(c_white);