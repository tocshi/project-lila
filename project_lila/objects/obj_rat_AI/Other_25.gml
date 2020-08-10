/// @description Received hit

if(isMoving && canAttack){
	isMoving = false;
}
aggro = true;
aggrorange = 512;

if(statmap[? "hp"] < statmap[? "maxhp"] * retreating_hp_threshold) {
	retreating = true;
	statmap[? "movespeed"] = retreating_movespeed;
}