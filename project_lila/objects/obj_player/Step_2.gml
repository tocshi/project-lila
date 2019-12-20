//CHECK DEATH
if (statmap[? "hp"] <= 0 && !isDead){
	isDead = true;
	for(var i = 0; i < array_length_1d(equips); ++i){
		if(equips[i] > 0){
			unequipItem(self,equips[i]);
		}
	}
	room_goto(rm_playerdeath);
}