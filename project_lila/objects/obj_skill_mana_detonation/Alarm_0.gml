if(!instance_exists(target)){
	instance_destroy();
	exit;
}

dmgCalc(target);
target.statmap[? "mp"]-=atkmap[? "atk"]*0.3;
started = true;
time = 0;
alarm[1] = 30;