cursor_sprite = spr_cursor;
global.pause = true;

updateGUI();
if(global.gui_state > 0){
	updateHotbar();
}