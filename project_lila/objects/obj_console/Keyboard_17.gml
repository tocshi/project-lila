/// @description Insert description here
// You can write your code in this editor
if (!is_active) exit;

if (keyboard_check(ord("C"))) {
	caret = 0;
	history_cursor = ds_list_size(history);
	keyboard_string = "";
}

if (keyboard_check(ord("G"))) {
	caret = 0;
	history_cursor = 0;
	keyboard_string = history[| history_cursor];
}
