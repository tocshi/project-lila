if(collision_point(x, y, target, false, true)){
	dmgCalc(target.id);
	summon_stormpiercer_at_rate(user,target,20);
	instance_destroy();
	exit;
}


