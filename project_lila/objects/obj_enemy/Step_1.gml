//CHECK DEATH
if (hp <= 0){
	isDead = true;
	mask_index = spr_empty;
	alarm[0] = 30;
}

//REGENERATION
hp += hpregen;
mp += mpregen;

//STAT CLAMPING
atkspeed = clamp(atkspeed,0.01,10);
movespeed = clamp(movespeed,0,30);
hp = clamp(hp,0,maxhp);
mp = clamp(mp,0,maxmp);