/// @description Check gui close and check LMB hold

if(global.gui_state == 1 && global.pause == 1){
	// check if a different item is already being dragged
	if(global.holding && !hold_activated) {
		// show_debug_message(string(findArrayIndex(global.playerInv, itemid)) + " skipping: other item being held!");
		exit;
	} else {
		// Check that the mouse is being held on the items coords
		if (mouse_check_button(mb_left)) {
			// show_debug_message(string(findArrayIndex(global.playerInv, itemid)) + " says hi");
			if (!global.holding && position_meeting(mouse_x, mouse_y, id)) {
				// first frame of LMB hold, set initial values
				//show_debug_message("holding!");
				global.holding = true;
				initial_lmb_x = mouse_x;
				initial_lmb_y = mouse_y;
				hold_activated = true;
			}
			if (hold_activated && !global.dragging) {
				// while holding, check until mouse goes past threshold for dragging
				if (point_distance(mouse_x, mouse_y, initial_lmb_x, initial_lmb_y) > drag_threshold) {
					global.dragging = true;
					//show_debug_message("drag started");
				}
			}
			// create the dragging item if it doesn't exist yet
			//show_debug_message("drag_activated: " + string(drag_activated));
			//show_debug_message("global.dragging: " + string(global.dragging));
			if (global.dragging && !drag_activated) {
				//show_debug_message("Dragging");
				with (instance_create_layer(x, y, "GUIPopup", obj_item_dragging)) {
					sprite_index = other.sprite_index;
					itemid = other.itemid;
					origin_type = other.type;
					origin_instance = other;
					origin_slot = findArrayIndex(global.itemBarBox, itemid);
				}
				drag_activated = true;
			}	
		} else {
			// reset hold/drag flags
			// drag_activated is set to false in the dragging item's LMB release event
			global.holding = false;
			global.dragging = false;
			hold_activated = false;
			drag_activated = false;
		}
	}
	exit;
}
instance_destroy();