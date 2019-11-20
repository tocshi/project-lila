/// @description Check gui close and check LMB hold

if(global.gui_state == 0 && global.pause == 1){
	if (mouse_check_button(mb_left)) {
		if (!holding) {
			// first frame of LMB hold, set initial values
			holding = true;
			initial_lmb_x = mouse_x;
			initial_lmb_y = mouse_y;
		}
		if (!dragging) {
			// while holding, check until mouse goes past threshold for dragging
			if (point_distance(mouse_x, mouse_y, initial_lmb_x, initial_lmb_y) > drag_threshold) {
				dragging = true;
			}
		} else {
			// while dragging, check if mouse is no longer meeting the threshold for dragging
			if (point_distance(mouse_x, mouse_y, initial_lmb_x, initial_lmb_y) <= drag_threshold) {
				dragging = false;
			}
		}
		if (dragging && itemid != 0) {
			show_debug_message("Dragging");
			drag_sprite.image_alpha = 0.5;
			draw_sprite(drag_sprite, image_index, mouse_x, mouse_y);
		}	
	} else {
		// reset hold/drag flags
		holding = false;
		dragging = false;
	}
	exit;
}
instance_destroy();

if (mouse_check_button(mb_left)) {
	show_debug_message("LMB detected");
	if (!holding) {
		// first frame of LMB hold, set initial values
		holding = true;
		var initial_lmb_x = mouse_x;
		var initial_lmb_y = mouse_y;
		show_debug_message("Holding");
	}
	if (!dragging) {
		// while holding, check until mouse goes past threshold for dragging
		if (point_distance(mouse_x, mouse_y, initial_lmb_x, initial_lmb_y) > drag_threshold) {
			dragging = true;
		}
	}
	if (dragging) {
		show_debug_message("Dragging");
		if(!drag_sprite_drawn) {
			var drag_sprite = ds_map_find_value(global.itemData[| itemid], "sprite");
			drag_sprite.image_alpha = 0.5;
			draw_sprite(drag_sprite, image_index, mouse_x, mouse_y);
		} else {
			drag_sprite.x = mouse_x;
			drag_sprite.y = mouse_y;
		}
		// if sprite does not exist
			// draw sprite of item of slot at mouse coords
	}	
} else {
	// reset hold/drag flags
	show_debug_message("LMB not detected");
	holding = false;
	dragging = false;
}