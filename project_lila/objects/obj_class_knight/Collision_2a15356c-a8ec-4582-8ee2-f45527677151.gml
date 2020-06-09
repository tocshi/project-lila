if(hasBuff(self.id,"Knight's Shield: Enhanced")){
	removeBuff(self.id,"Knight's Shield: Enhanced",false);
	set_skill_cd("Greater Shielding",5*room_speed);
}
