//REGENERATION
hp += hpregen;
if(highRegenThreshold >= 90){
	mp += mpregen*2;
} else {
	mp += mpregen;
}

//STAT CLAMPING
atkspeed = clamp(atkspeed,0.01,10);
movespeed = clamp(movespeed,0,30);
hp = clamp(hp,0,maxhp);
mp = clamp(mp,0,maxmp);

//TIMERS
for (var i = 0; i < array_length_1d(cd); i++){
	if(cd[i] > 0){cd[i]--;}
}

for (var i = 0; i < array_length_1d(buff); i++){
	if(buff[i] > 0){buff[i]--;}
}

//COUNTDOWN EVENTS
if (cd[0] == 1){canMove = true;}

