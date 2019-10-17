buffName = argument0;

switch(buffName){
	
	case "Stunned":
	canMove = false;
	canAttack = false;
	canUseSkill = false;
	isCCed = true;
	break;
	
	case "Empowered":
	var effect = instance_create_layer(x,y+32,"Assets_1",obj_debug_buff);
	effect.vspeed = -1;
	break;

	case "Knight's Shield":
	var effect = instance_create_layer(x,y,"Assets_1",obj_skill_knight_shield);
	effect.image_alpha = 0.3;
	effect.direction = irandom_range(0,359);
	effect.speed = 1;
	
	isBlocking = true;
	break;

}