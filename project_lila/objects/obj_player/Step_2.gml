//CHECK DEATH
if (statmap[? "hp"] <= 0 && !isDead){
	isDead = true;
	room_goto(rm_playerdeath);
}