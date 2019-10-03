if(ds_list_find_index(hitList,other.id) == -1){
	ds_list_add(hitList,other.id);
	
	e_maxhp			= other.maxhp;
	e_hp			= other.hp;
	e_hpshield		= other.hpshield;
	e_def			= other.def;

	e_fire_def		= other.fire_def;
	e_ice_def		= other.ice_def;
	e_lightning_def	= other.lightning_def;
	e_earth_def		= other.earth_def;
	e_wind_def		= other.wind_def;
	e_light_def		= other.light_def;
	e_dark_def		= other.dark_def;

	e_finalshld		= other.finalshld;

	// (ATK * skill dmg modifier(s) - enemy DEF) * crit damage modifier 
	// * elemental affinity multiplier * total damage multiplier * enemy damage mitigation

	switch(element){
		case "none":
		elem_mod = 100;
		break;
		case "fire":
		elem_mod = (fire_atk - e_fire_def) + 100;
		break;
		case "ice":
		elem_mod = (ice_atk - e_ice_def) + 100;
		break;
		case "lightning":
		elem_mod = (lightning_atk - e_lightning_def) + 100;
		break;
		case "earth":
		elem_mod = (earth_atk - e_earth_def) + 100;
		break;
		case "wind":
		elem_mod = (wind_atk - e_wind_def) + 100;
		break;
		case "light":
		elem_mod = (light_atk - e_light_def) + 100;
		break;
		case "dark":
		elem_mod = (dark_atk - e_dark_def) + 100;
		break;
	}

	var intDmg = ((atk * (dmgmod/100)) - e_def);
	if(intDmg < 0){intDmg = 0;}
	
	if(random_range(0,100) < critrate){
		if(random_range(0,100) < critrate-100){
			critdmg *= 1.5;
			isOrangeCrit = true;
			if(random_range(0,100) < critrate-200){
				critdmg *= 2;
				isRedCrit = true;
			}
		}
		isCrit = true;
	} else {
		critdmg = 100;
	}
	
	gTotalDamage = intDmg * (critdmg/100) * (elem_mod/100) * (finaldmg/100) * ((100-e_finalshld)/100);
	gTotalDamage = round(gTotalDamage);

	other.hp -= gTotalDamage;

	dmgTxt = instance_create_layer(other.x, other.y, "dmgTxt", obj_dmgtxt);
	dmgTxt.damage = gTotalDamage;
	dmgTxt.isCrit = isCrit;
	dmgTxt.isOrangeCrit = isOrangeCrit;
	dmgTxt.isRedCrit = isRedCrit;
}

