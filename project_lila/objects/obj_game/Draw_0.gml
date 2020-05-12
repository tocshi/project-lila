if(global.pause){
	var x0 = camera_get_view_x(global.currentCamera);
	var y0 = camera_get_view_y(global.currentCamera);
	switch(global.gui_state){
		// Inventory
		case 1:
		draw_set_alpha(1);
		draw_sprite(gui_inv,-1,x0,y0);
		// draw stats
		draw_set_font(fnt_gui_small);
		// adjust stats if preview locked
		var locked = false;
		var equipped = false;
		if(global.inv_item_preview_lock >= 0){
			locked = true;
			if(ds_map_find_value(global.itemData[| global.inv_item_preview_lock],"type") == "equippable"){
				if(global.player.equips[getEquipSlot(global.inv_item_preview_lock)] > 0){
					equipped = true;
				}
			}
		}
		for(var i = 0; i < 24; ++i){
			var stat_number = global.player.statmap[? global.equipStats[| i]];
			var xx = x0 + invStatLocation[i,0];
			var yy = y0 + invStatLocation[i,1];
			draw_sprite(spr_stat,i,xx,yy);
			draw_set_halign(fa_left);
			draw_set_valign(fa_top);
			draw_set_color(c_black);
			if(global.equipStats[| i] == "hpregen" || global.equipStats[| i] == "mpregen"){
				draw_text(xx,yy-4, "   " + string(room_speed*stat_number));
			}
			else{draw_text(xx,yy-4, "   " + string(stat_number));}		
			// this if statement looks like it's fucked but trust me it isn't
			// it adjusts the displayed stat based of if a preview lock is active
			// and calculates the stat difference between an equipped item and the previewed item
			var difference = 0;
		    var diff_string = "";
			if(locked){
				if(equipped && ds_map_exists(global.itemData[| global.player.equips[getEquipSlot(global.inv_item_preview_lock)]],string(global.equipStats[| i]))){
					difference -= ds_map_find_value(global.itemData[| global.player.equips[getEquipSlot(global.inv_item_preview_lock)]],string(global.equipStats[| i]));
				}
				if(ds_map_exists(global.itemData[| global.inv_item_preview_lock],string(global.equipStats[| i]))){
					difference += ds_map_find_value(global.itemData[| global.inv_item_preview_lock],string(global.equipStats[| i]));
				}
				if(difference > 0){
					draw_set_color(c_green);
					diff_string = "    +";
				}
				else if(difference < 0){
					draw_set_color(c_red);
					diff_string = "    -";
				}
				if(difference != 0){
					if(global.equipStats[| i] == "hpregen" || global.equipStats[| i] == "mpregen"){
						draw_text(xx+string_width(string(room_speed*stat_number)),yy-4, diff_string + string(room_speed*abs(difference)));
					}
					else{draw_text(xx+string_width(string(stat_number)),yy-4, diff_string + string(abs(difference)));}
				}
			}			
		}
	
		// check for hover
		if(instance_position(mouse_x,mouse_y,obj_item_inv) != noone){
			global.inv_item_hover = instance_position(mouse_x,mouse_y,obj_item_inv).itemid;
		}
		else{
			if(mouse_check_button_pressed(mb_left)){
				global.inv_item_preview_lock = -1;
			}
			global.inv_item_hover = -1;
		}
		
		// draw item preview
		if(global.inv_item_hover >= 0 || global.inv_item_preview_lock >= 0){
			var preview_itemid = global.inv_item_hover;
			if(global.inv_item_preview_lock >= 0){preview_itemid = global.inv_item_preview_lock;}
			// draw item name
			draw_set_halign(fa_left);
			draw_set_valign(fa_top);
			draw_set_font(fnt_gui_medium);
			var item_name = ds_map_find_value(global.itemData[| preview_itemid],"name");
			var width_scale = min(1,16/string_length(item_name));
			draw_text_outlined_transformed(x0+1190,y0+123,c_black,c_white,item_name,width_scale,1,0);
			// draw item image
			draw_sprite_ext(asset_get_index(ds_map_find_value(global.itemData[| preview_itemid],"sprite")),0,x0+1208,y0+222,3,3,0,c_white,1);
			// draw item description
			draw_set_font(fnt_gui_small);
			draw_set_color(c_black);
			// Trim characters past item_desc_line_length chars
			ds_list_clear(item_desc_lines);
			item_desc_lines[| 0] = ds_map_find_value(global.itemData[| preview_itemid],"desc");
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
			var item_predesc = "Level " + string(ds_map_find_value(global.itemData[| preview_itemid],"lvl")) + " " + string(ds_map_find_value(global.itemData[| preview_itemid],"category"));
			draw_text(x0+1187, y0+466, item_predesc);
			var y_offset = 0;
			for (var i = 0; i < ds_list_size(item_desc_lines); ++i) {
				draw_text(x0+1187, y0+506+y_offset, item_desc_lines[| i]);
				y_offset += 20;
			}
		}
		break;
		
		// Skills
		case 2:
		draw_set_alpha(1);
		draw_sprite(gui_skills,-1,x0,y0);
		
		// TEMP draw cpp
		draw_set_halign(fa_left);
		draw_set_valign(fa_top);
		draw_set_font(fnt_gui_medium);
		draw_set_color(c_white);
		draw_text(x0+1080,y0+370,"Class Proficiency: " + string(global.player.statmap[? "cpp"]));
		
		//debug
		var skill_sprite = asset_get_index("spr_skill_icons_" + string_lower(global.player.statmap[? "class"]));
		for(var i = 0; i < 8; ++i){
			var xx = x0 + global.equippedSkillBox[i,0];
			var yy = y0 + global.equippedSkillBox[i,1];
			if(global.player.skills[i] != ""){
				draw_sprite(skill_sprite,get_skill_data(global.player.skills[i],"sprmap"),xx,yy);
			}
			draw_set_alpha(0.7);
			draw_set_halign(fa_left);
			draw_set_valign(fa_top);
			draw_set_font(fnt_gui_medium);
			draw_set_color(c_white);
			draw_sprite(spr_skill_overlay,0,xx,yy);
			var keystring = "key_skill" + string(i);
			var key = variable_global_get(keystring);
			switch(key){
				case vk_enter:
					key = "Enter";
					break;
				case vk_tab:
					key = "Tab";
					break;
				case vk_shift:
					key = "Shift";
					break;
				case vk_control:
					key = "Ctrl";
					break;
				case vk_space:
					key = "Space (Do not use for now!)";
					break;
				case 191:
					key = "/";
					break;
				default:
					key = chr(key);
			}
			draw_text(xx+33,yy,key);
			draw_set_alpha(1);
		}
		for(var i = 0; i < 24; ++i){
			var xx = x0 + global.availableSkillBox[i,0];
			var yy = y0 + global.availableSkillBox[i,1];
			draw_sprite(skill_sprite,i,xx,yy);
		}
		break;
	}
}

draw_set_color(c_white);