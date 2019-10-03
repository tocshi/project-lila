//CHECK DEATH
if (hp == 0){
	instance_destroy();
	//this is where on death events happen
}

//REGENERATION
hp += hpregen;
mp += mpregen;

//STAT CLAMPING
atkspeed = clamp(atkspeed,0.01,10);
movespeed = clamp(movespeed,0,30);
hp = clamp(hp,0,maxhp);
mp = clamp(mp,0,maxmp);