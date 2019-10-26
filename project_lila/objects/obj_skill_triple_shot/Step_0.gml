if(collision_point(x, y, target, false, true)){
	atkmap[? "isCrit"]			= false;

	// (ATK * skill dmg modifier(s) - enemy DEF) * crit damage modifier 
	// * elemental affinity multiplier * total damage multiplier * enemy damage mitigation

	switch(atkmap[? "element"]){
		case "none":
		atkmap[? "elem_mod"] = 100;
		break;
		case "fire":
		atkmap[? "elem_mod"] = (atkmap[? "fire_atk"] - target.statmap[? "fire_def"]) + 100;
		break;
		case "ice":
		atkmap[? "elem_mod"] = (atkmap[? "ice_atk"] - target.statmap[? "ice_def"]) + 100;
		break;
		case "lightning":
		atkmap[? "elem_mod"] = (atkmap[? "lightning_atk"] - target.statmap[? "lightning_def"]) + 100;
		break;
		case "earth":
		atkmap[? "elem_mod"] = (atkmap[? "earth_atk"] - target.statmap[? "earth_def"]) + 100;
		break;
		case "wind":
		atkmap[? "elem_mod"] = (atkmap[? "wind_atk"] - target.statmap[? "wind_def"]) + 100;
		break;
		case "light":
		atkmap[? "elem_mod"] = (atkmap[? "light_atk"] - target.statmap[? "light_def"]) + 100;
		break;
		case "dark":
		atkmap[? "elem_mod"] = (atkmap[? "dark_atk"] - target.statmap[? "dark_def"]) + 100;
		break;
	}

	var intDmg = ((atkmap[? "atk"] * (atkmap[? "dmgmod"]/100)) - target.statmap[? "def"] * (other.statmap[? "level"]/20));
	if(intDmg < 0){intDmg = 0;}
	
	var fcritdmg = atkmap[? "critdmg"];
	fcritdmg = 100;
	if(random_range(0,100) < atkmap[? "critrate"]){
		atkmap[? "isCrit"] = true;
		fcritdmg = atkmap[? "critdmg"];
		if(random_range(0,100) < atkmap[? "critrate"]-100){
			fcritdmg *= 1.5;
			atkmap[? "isOrangeCrit"] = true;
			if(random_range(0,100) < atkmap[? "critrate"]-200){
				fcritdmg *= 1.5;
				atkmap[? "isRed Crit"] = true;
			}
		}
	}
	
	var fblk = 0;
	
	if(target.isBlocking){
		var fblk = target.statmap[? "blkmod"];
	}
	fblk = clamp(fblk,0,100);
	
	gTotalDamage = intDmg * (fcritdmg/100) * (atkmap[? "elem_mod"]/100) * (atkmap[? "finaldmg"]/100) * ((100-fblk)/100) * ((100-target.statmap[? "finalshld"])/100);
	gTotalDamage = round(gTotalDamage);

	target.statmap[? "hp"] -= gTotalDamage;
	e_hp = target.statmap[? "hp"];
	e_maxhp = target.statmap[? "maxhp"];

	var dmgTxt = instance_create_layer(target.x, target.y-(target.sprite_height/2), "dmgTxt", obj_dmgtxt);
	dmgTxt.damage = gTotalDamage;
	dmgTxt.isCrit = atkmap[? "isCrit"];
	dmgTxt.isOrangeCrit = atkmap[? "isOrangeCrit"];
	dmgTxt.isRedCrit = atkmap[? "isRedCrit"];
	
	dmgTxt.hp		= e_hp;
	dmgTxt.maxhp	= e_maxhp;
	dmgTxt.target	= target;
	
	if(instance_exists(target) && ds_exists(target.statmap,ds_type_map)){
	var minihp = instance_create_layer(target.x, target.y, "dmgTxt", obj_minihpbar);
	minihp.hp		= e_hp;
	minihp.maxhp	= e_maxhp;
	minihp.hpwidth	= target.sprite_width;
	minihp.target	= target.id;
	}
	
	atkmap[? "isCrit"]			= false;
	
	ds_map_destroy(atkmap);
	instance_destroy();
	exit;
}


