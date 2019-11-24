/// @description Check gui close and check LMB hold

if(global.gui_state == 0 && global.pause == 1){
	if (mouse_check_button(mb_left) && !drag_activated && position_meeting(mouse_x, mouse_y, id)) {
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
		if (dragging && drag_sprite_set == true) {
			// show_debug_message("Dragging");
			with (instance_create_layer(x, y, "GUIPopup", obj_item_dragging)) {
				sprite_index = other.drag_sprite;
				itemid = other.itemid;
				origin_instance = other;
			}
			drag_activated = true;
		}	
	} else {
		// reset hold/drag flags
		holding = false;
		dragging = false;
	}
	exit;
}
instance_destroy();