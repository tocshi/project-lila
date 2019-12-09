/// @description Check that mouse is still held
// You can write your code in this editor

// Sometimes the LMB release check fails when releasing while dragging really fast 
// so this additional check guarantees safety
if (!mouse_check_button(mb_left)) {
	show_debug_message("destroying!");
	origin_instance.drag_activated = false;
	instance_destroy();
}

x = mouse_x;
y = mouse_y;