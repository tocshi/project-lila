if(hasBuff(self.id,"Knight's Shield: Enhanced")){
	removeBuff(self.id,"Knight's Shield: Enhanced",false);
	cd[findArrayIndex(skills,"Greater Shielding")+1] = 5*room_speed;
}
