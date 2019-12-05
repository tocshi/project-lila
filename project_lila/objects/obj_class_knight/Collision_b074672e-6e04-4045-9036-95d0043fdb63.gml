if(shield_charge){
	//turn into a shield attack obj
	
	if(ds_list_find_index(scList,other.id) == -1){
		ds_list_add(scList,other.id);
	

		var intDmg = ((statmap[? "atk"] * (50/100)) - other.statmap[? "def"]);
		if(intDmg < 0){intDmg = 0;}
	
		var fcritdmg = statmap[? "critdmg"];
		fcritdmg = 100;
		if(random_range(0,100) < statmap[? "critrate"]){
			statmap[? "isCrit"] = true;
			fcritdmg = statmap[? "critdmg"];
			if(random_range(0,100) < statmap[? "critrate"]-100){
				fcritdmg *= 1.5;
				statmap[? "isOrangeCrit"] = true;
				if(random_range(0,100) < statmap[? "critrate"]-200){
					fcritdmg *= 1.5;
					statmap[? "isRed Crit"] = true;
				}
			}
		}
	
	
	
		gTotalDamage = intDmg * (fcritdmg/100) * (statmap[? "finaldmg"]/100) * ((100-other.statmap[? "finalshld"])/100);
		gTotalDamage = round(gTotalDamage);

		other.statmap[? "hp"] -= gTotalDamage;
		e_hp = other.statmap[? "hp"];
		e_maxhp = other.statmap[? "maxhp"];

		var dmgTxt = instance_create_layer(other.x, other.y-(other.sprite_height/2), "dmgTxt", obj_dmgtxt);
		dmgTxt.damage = gTotalDamage;
		dmgTxt.isCrit = statmap[? "isCrit"];
		dmgTxt.isOrangeCrit = statmap[? "isOrangeCrit"];
		dmgTxt.isRedCrit = statmap[? "isRedCrit"];
	
		dmgTxt.hp		= e_hp;
		dmgTxt.maxhp	= e_maxhp;
		dmgTxt.target	= other;
	
		if(instance_exists(other) && ds_exists(other.statmap,ds_type_map)){
			var minihp = instance_create_layer(other.x, other.y, "dmgTxt", obj_minihpbar);
			minihp.hp		= e_hp;
			minihp.maxhp	= e_maxhp;
			minihp.hpwidth	= other.sprite_width;
			minihp.target	= other.id;
		}
		statmap[? "isCrit"]				= false;
		statmap[? "isOrangeCrit"]		= false;
		statmap[? "isRedCrit"]			= false;
	}
	if(other.canKnockback){
		other.atkTimer = 5;
		other.direction = point_direction(x,y,other.x,other.y);
		other.speed = 5;
	}
	
}