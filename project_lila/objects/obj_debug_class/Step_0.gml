event_inherited();

if(mouse_check_button_pressed(mb_left) && (cd[0] <= 0) && (mp >= 20)){
	
	mp -= 20;
	speed = 0;
	isMoving = false;
	canMove = false;
	cd[0] = room_speed/atkspeed;
	
	var basic_attack = instance_create_layer(x,y-32,"Attacks",obj_debug_attacks);
	basic_attack.skill_index = 0;
	basic_attack.atkspeed = self.atkspeed;
	iter0++;
	basic_attack.iter0 = self.iter0;
	
	//I am not doing this correctly
	basic_attack.atk			= atk;
	basic_attack.dmgmod			= 100;
	basic_attack.element		= "none";
	basic_attack.atkspeed		= atkspeed;
	basic_attack.fire_atk		= fire_atk;
	basic_attack.ice_atk		= ice_atk;
	basic_attack.lightning_atk	= lightning_atk;
	basic_attack.earth_atk		= earth_atk;
	basic_attack.wind_atk		= wind_atk;
	basic_attack.light_atk		= light_atk;
	basic_attack.dark_atk		= dark_atk;
	basic_attack.critrate		= critrate;
	basic_attack.critdmg		= critdmg;
	basic_attack.finaldmg		= finaldmg;
	
	basic_attack.isBasicAttack	= true;
	basic_attack.isSingleHit	= true;

}
