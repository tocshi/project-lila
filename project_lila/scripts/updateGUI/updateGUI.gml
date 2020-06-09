var x0 = camera_get_view_x(global.currentCamera);
var y0 = camera_get_view_y(global.currentCamera);

switch(global.gui_state){
	case -1:
		exit;
		break;
	
	case 1:
		// Clean up existing gui elements
		instance_destroy(obj_item_inv);
		instance_destroy(obj_text_inv);
		instance_destroy(obj_context_menu);
		instance_destroy(obj_context_menu_button);
		instance_destroy(obj_generic_btn);
		
		// Make gui elements
		for(var i = 0; i < 12; ++i){
			if(global.player.equips[i] > 0){
				var item = instance_create_layer(x0 + global.equipItemBox[i,0],
												y0 + global.equipItemBox[i,1],
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
				var item = instance_create_layer(x0 + global.invItemBox[findArrayIndex(global.playerInv, i),0],
												y0 + global.invItemBox[findArrayIndex(global.playerInv, i),1],
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
		
		
		
		// Generate Skill objects
		case 2:
			// Clean up existing gui elements
			instance_destroy(obj_skill_inv);
			instance_destroy(obj_text_inv);
			instance_destroy(obj_context_menu);
			instance_destroy(obj_context_menu_button);
			instance_destroy(obj_generic_btn);
			
			// Create skill grid items
			for(var i = 0; i < 24; ++i){
				var xx = x0 + global.availableSkillBox[i,0];
				var yy = y0 + global.availableSkillBox[i,1];
				var found = false;
				for(var j = 0; j < ds_list_size(global.skillData); ++j){
					if(ds_map_find_value(global.skillData[| j],"class") == global.player.statmap[? "class"]
					&& ds_map_find_value(global.skillData[| j],"slot") == i){
						if(i == 0){
							// set skill hover to first skill
							global.inv_skill_hover = ds_map_find_value(global.skillData[| j],"name");
						}
						with(instance_create_layer(xx, yy, "GUI", obj_skill_inv)){
							type = AVAILABLE;
							name = ds_map_find_value(global.skillData[| j],"name");
							sprite_index = asset_get_index("spr_skill_icons_" + string_lower(global.player.statmap[? "class"]));
							image_index = ds_map_find_value(global.skillData[| j],"sprmap");
							// show_debug_message("skill.sprite_index = " + sprite_get_name(skill.sprite_index));
							// show_debug_message("skill.image_index = " + string(skill.image_index));
						}
						found = true;
					}
				}
				if(!found){
					draw_sprite(spr_empty,0,xx,yy); // USE SPR_NO_SKILL WHEN SPRITE EXISTS IN PROJECT
				}
			}

			// Create items in equipped skill bar
			for(var i = 0; i < 8; ++i){
				var xx = x0 + global.equippedSkillBox[i,0];
				var yy = y0 + global.equippedSkillBox[i,1];
				var skillname = global.player.skills[i];
				if(skillname != ""){
					with(instance_create_layer(xx, yy, "GUI", obj_skill_inv)){
						type = EQUIP;
						name = skillname;
						skill_key = i;
						sprite_index = asset_get_index("spr_skill_icons_" + string_lower(get_skill_data(skillname,"class")));
						image_index = get_skill_data(skillname,"sprmap");
					}
				}
			}
			
			// Create unlock skill button
			with(instance_create_layer(x0+1261,y0+478,"GUIPopUpButton",obj_generic_btn)){
				sprite_index = spr_skill_unlock_button;
				mask_index = spr_skill_unlock_button;
				type = "Skill Unlock";
				align = TOP_LEFT;
				font = fnt_hpmp;
				halign = fa_center;
				valign = fa_center;
				left_offset = sprite_width/2;
				top_offset = sprite_height/2;
				is_outlined = true;
			}
			break;
}


