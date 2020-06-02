/// @description Check gui close and check LMB hold

if(global.gui_state == 2 && global.pause == 1){
	if(instance_exists(obj_skill_dragging)){
		exit;
		}
	// check if a different item is already being dragged
	if(global.holding && !hold_activated) {
		exit;
	} 
	if(!has_skill_unlocked(name)) {
		exit;
	} 
	else {
		// Check that the mouse is being held on the items coords
		if (mouse_check_button(mb_left)) {
			if (!global.holding && position_meeting(mouse_x, mouse_y, id)) {
				// first frame of LMB hold, set initial values
				global.holding = true;
				initial_lmb_x = mouse_x;
				initial_lmb_y = mouse_y;
				hold_activated = true;
			}
			if (hold_activated && !global.dragging) {
				// while holding, check until mouse goes past threshold for dragging
				if (point_distance(mouse_x, mouse_y, initial_lmb_x, initial_lmb_y) > drag_threshold) {
					global.dragging = true;
				}
			}
			// create the dragging item if it doesn't exist yet
			if (global.dragging && !drag_activated) {
				with (instance_create_layer(x, y, "GUIPopUp", obj_skill_dragging)) {
					name = other.name;
					origin_type = other.type;
					origin_instance = other;
					origin_skill_key = other.skill_key;
					sprite_index = other.sprite_index;
					image_index = other.image_index;
				}
				drag_activated = true;
				global.inv_skill_preview_lock = name;
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