if(ds_list_find_index(hitList,other.id) == -1){
	ds_list_add(hitList,other.id);
	
	atkmap[? "isCrit"]			= false;

	// (ATK * skill dmg modifier(s) - enemy DEF) * crit damage modifier 
	// * elemental affinity multiplier * total damage multiplier * enemy damage mitigation

	switch(atkmap[? "element"]){
		case "none":
		atkmap[? "elem_mod"] = 100;
		break;
		case "fire":
		atkmap[? "elem_mod"] = (atkmap[? "fire_atk"] - other.statmap[? "fire_def"]) + 100;
		break;
		case "ice":
		atkmap[? "elem_mod"] = (atkmap[? "ice_atk"] - other.statmap[? "ice_def"]) + 100;
		break;
		case "lightning":
		atkmap[? "elem_mod"] = (atkmap[? "lightning_atk"] - other.statmap[? "lightning_def"]) + 100;
		break;
		case "earth":
		atkmap[? "elem_mod"] = (atkmap[? "earth_atk"] - other.statmap[? "earth_def"]) + 100;
		break;
		case "wind":
		atkmap[? "elem_mod"] = (atkmap[? "wind_atk"] - other.statmap[? "wind_def"]) + 100;
		break;
		case "light":
		atkmap[? "elem_mod"] = (atkmap[? "light_atk"] - other.statmap[? "light_def"]) + 100;
		break;
		case "dark":
		atkmap[? "elem_mod"] = (atkmap[? "dark_atk"] - other.statmap[? "dark_def"]) + 100;
		break;
	}
	
	var intDmg = ((atkmap[? "atk"] * (atkmap[? "dmgmod"]/100)) - other.statmap[? "def"]);
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
	
	
	
	gTotalDamage = intDmg * (fcritdmg/100) * (atkmap[? "elem_mod"]/100) * (atkmap[? "finaldmg"]/100) * ((100-other.statmap[? "finalshld"])/100);
	gTotalDamage = round(gTotalDamage);

	other.statmap[? "hp"] -= gTotalDamage;
	e_hp = other.statmap[? "hp"];
	e_maxhp = other.statmap[? "maxhp"];

	var dmgTxt = instance_create_layer(other.x, other.y-(other.sprite_height/2), "dmgTxt", obj_dmgtxt);
	dmgTxt.damage = gTotalDamage;
	/*
	dmgTxt.isCrit = atkmap[? "isCrit"];
	dmgTxt.isOrangeCrit = atkmap[? "isOrangeCrit"];
	dmgTxt.isRedCrit = atkmap[? "isRedCrit"];
	*/
	dmgTxt.playerDamaged = true;
	
	dmgTxt.hp		= e_hp;
	dmgTxt.maxhp	= e_maxhp;
	dmgTxt.target	= other;
	
	atkmap[? "isCrit"]			= false;
	
	if(ds_map_exists(atkmap,"isPiercing") && ds_map_exists(atkmap,"isProjectile")){
		if(!atkmap[? "isPiercing"]){
			ds_map_destroy(atkmap);
			instance_destroy();
		}
	}
	
	/*
	if (other.canKnockback){
		hit_flinch(other, point_direction(sourceX,sourceY,other.x,other.y), flinch_amount);
	}*/
}

