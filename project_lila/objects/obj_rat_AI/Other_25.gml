/// @description Received hit

if(isMoving && canAttack){
	isMoving = false;
}
aggro = true;
aggrorange = 480;
// this is performed before the last hit by is set, allowing the attack timer to reset to 30 if not aggroing
if(lastHitBy == noone){atkTimer = 30;}

if(statmap[? "hp"] < statmap[? "maxhp"] * retreating_hp_threshold) {
	retreating = true;
	statmap[? "movespeed"] = retreating_movespeed;
}