time++;
if(isSpawning){
	/*
	mask_index = spr_empty;
	canAttack = false;
	canMove = false;
	image_alpha += 1/spawntime;
	if(image_alpha >= 1){
		isSpawning = false;
		mask_index = sprite_index;
		canAttack = true;
		canMove = true;
	}
	*/
	isSpawning = false;
	mask_index = sprite_index;
}
if(isDead){
	visible_wall_obj.image_alpha-=(1/30);
	statmap[? "movespeed"] = 0;
}