buffName = argument0;

switch(buffName){
	
	case "Stunned":
	canMove = false;
	canAttack = false;
	canUseSkill = false;
	isCCed = true;
	break;
	
	case "Empowered":
	var effect = instance_create_layer(x,y+32,"Assets_1",obj_skill_empowered);
	effect.vspeed = -1;
	break;

	case "Knight's Shield":
	var effect = instance_create_layer(x,y,"Assets_1",obj_skill_knight_shield);
	effect.image_alpha = 0.3;
	effect.direction = irandom_range(0,359);
	effect.speed = 1;
	isBlocking = true;
	break;
	
	case "Knight's Shield: Enhanced":
	var effect = instance_create_layer(x,y,"Assets_1",obj_skill_knight_shield);
	effect.image_alpha = 0.3;
	effect.direction = irandom_range(0,359);
	effect.speed = 1;
	effect.image_xscale = 0.5;
	effect.image_yscale = 0.5;
	effect.image_blend = c_aqua;
	if(statChange){statmap[? "finalshld"]+=100;}
	break;
	
	case "Aegis Aura":
	if(statChange){
		statmap[? "atk"]+=basestatmap[? "atk"]*0.1;
		statmap[? "atk"]+=20;
		statmap[? "def"]+=basestatmap[? "def"]*0.1;
		statmap[? "def"]+=20;
		statmap[? "hpregen"]+=2/room_speed;
	}
	break;
	
	case "Move Like Wind":
	if(current_time%14 = 0){
		instance_create_layer(x,y+32,"Assets_1",obj_skill_move_like_wind);
	}
	if(statChange){
		statmap[? "movespeed"]+=4;
		statmap[? "movespeed"]+=basestatmap[? "atkspeed"];
		statmap[? "atkspeed"]+=0.25*basestatmap[? "movespeed"];
	}
	break;
	
	case "Unleash":
	if(statChange){statmap[? "finalshld"]+=100;}
	break;
	default:
}