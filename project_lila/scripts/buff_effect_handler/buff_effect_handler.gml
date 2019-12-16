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
	if(current_time%14 == 0){
		instance_create_layer(x,y+32,"Assets_1",obj_skill_move_like_wind);
	}
	if(statChange){
		statmap[? "movespeed"]+=4;
		statmap[? "movespeed"]+=basestatmap[? "atkspeed"];
		statmap[? "atkspeed"]+=0.25*basestatmap[? "movespeed"];
	}
	break;
	
	case "Unyielding Barrage":
	if(statChange){
		statmap[? "critrate"]+=2*get_buff_data(self,"Unyielding Barrage","stacks");
	}
	break;
	
	case "Burn":
	instance_create_layer(irandom_range(x-sprite_width/2,x+sprite_width/2),irandom_range(y-sprite_height/2,y+sprite_height/2),"Assets_1",obj_burn_effect);
	if(get_buff_data(self,"Burn","time") % 60 = 30){
		var burndmg = (get_buff_data(self,"Burn","data") - max(0,statmap[? "fire_def"]))*get_buff_data(self,"Burn","stacks");
		statmap[? "hp"]-=burndmg;
		
		with(instance_create_layer(irandom_range(x-10,x+10), 
									irandom_range(y-(sprite_height/2)-5,y-(sprite_height/2)+5), 
									"dmgTxt", obj_dmgtxt)){
			damage = burndmg;
	
			hp		= other.statmap[? "hp"];
			maxhp	= other.statmap[? "maxhp"];
			self.target	= other;							
		}

	
		if(instance_exists(self) && ds_exists(statmap,ds_type_map)){
			with(instance_create_layer(x, y, "dmgTxt", obj_minihpbar)){
				hp		= other.statmap[? "hp"];
				maxhp	= other.statmap[? "maxhp"];
				hpwidth	= other.sprite_width;
				self.target	= other.id;
			}
		}
	}
	break;
	
	case "Chilled":
	if(get_buff_data(self,"Chilled","time")%15 == 0){
		instance_create_layer(irandom_range(x-sprite_width/2,x+sprite_width/2),irandom_range(y-sprite_height/2,y+sprite_height/2),"Assets_1",obj_chill_effect);
	}
	if(statChange){
		statmap[? "movespeed"]-=basestatmap[? "movespeed"]*0.3;
	}
	break;
	
	case "Electrified":
	if(statChange){
		statmap[? "fire_def"]-=8;
		statmap[? "ice_def"]-=8;
		statmap[? "lightning_def"]-=8;
		statmap[? "earth_def"]-=8;
		statmap[? "wind_def"]-=8;
	}
	break;
	
	case "Unleash":
	if(statChange){statmap[? "finalshld"]+=100;}
	break;
	default:
}