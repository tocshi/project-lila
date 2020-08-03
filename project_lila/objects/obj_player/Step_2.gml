//CHECK DEATH
if (statmap[? "hp"] <= 0 && !isDead){
	isDead = true;
	global.gui_state = -1;
	global.pause = false;
	store_player_data_trans();
	room_goto(rm_playerdeath);
}

// reset useSkill
useSkill = "";