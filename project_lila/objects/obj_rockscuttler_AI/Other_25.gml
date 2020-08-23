/// @description Received hit

if(isMoving && canAttack){
	isMoving = false;
}
aggrorange = 512;

if(statmap[? "hp"] < statmap[? "maxhp"]/2 && shield_cooldown <= 0) {
	atkTimer = 15;
}

