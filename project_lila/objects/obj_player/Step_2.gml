//CHECK DEATH
if (statmap[? "hp"] <= 0 && !isDead){
	isDead = true;
	store_player_data_trans();
	room_goto(rm_playerdeath);
}