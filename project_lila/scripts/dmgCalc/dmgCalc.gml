var target = argument0;

atkmap[? "isCrit"]			= false;

// (ATK * skill dmg modifier(s) - enemy DEF) * crit damage modifier 
// * elemental affinity multiplier * total damage multiplier * enemy damage mitigation

switch(atkmap[? "element"]){
	case "none":
	atkmap[? "elem_mod"] = 100;
	break;
	case "fire":
	atkmap[? "elem_mod"] = (atkmap[? "fire_atk"] - target.statmap[? "fire_def"])*5 + 100;
	break;
	case "ice":
	atkmap[? "elem_mod"] = (atkmap[? "ice_atk"] - target.statmap[? "ice_def"])*5 + 100;
	break;
	case "lightning":
	atkmap[? "elem_mod"] = (atkmap[? "lightning_atk"] - target.statmap[? "lightning_def"])*5 + 100;
	break;
	case "earth":
	atkmap[? "elem_mod"] = (atkmap[? "earth_atk"] - target.statmap[? "earth_def"])*5 + 100;
	break;
	case "wind":
	atkmap[? "elem_mod"] = (atkmap[? "wind_atk"] - target.statmap[? "wind_def"])*5 + 100;
	break;
	case "light":
	atkmap[? "elem_mod"] = (atkmap[? "light_atk"] - target.statmap[? "light_def"])*5 + 100;
	break;
	case "dark":
	atkmap[? "elem_mod"] = (atkmap[? "dark_atk"] - target.statmap[? "dark_def"])*5 + 100;
	break;
}

var intDmg = ((atkmap[? "atk"] * (atkmap[? "dmgmod"]/100)));
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
gTotalDamage = round(gTotalDamage*(100/(100+target.statmap[? "def"])));

deal_damage(target, gTotalDamage)

e_hp = target.statmap[? "hp"];
e_maxhp = target.statmap[? "maxhp"];

if(variable_instance_exists(self.id,"user")){
	onhit_effect_handler(user,target);
}

var playerDamaged = false;
if(target == global.player || object_is_ancestor(target.object_index,obj_ally)){playerDamaged = true;}
var yy = target.y-(target.sprite_height/2);
var valid = false;
while(collision_point(target.x,yy,obj_dmgtxt,false,true)){
	with(instance_nearest(target.x,yy,obj_dmgtxt)){
		if(dist > 20){valid = true;}
	}
	if(valid){break;}
	yy-=32;
}
with(instance_create_layer(irandom_range(target.x-10,target.x+10), 
							yy, 
							"dmgTxt", obj_dmgtxt)){
	damage = other.gTotalDamage;
	isCrit = other.atkmap[? "isCrit"];
	isOrangeCrit = other.atkmap[? "isOrangeCrit"];
	isRedCrit = other.atkmap[? "isRedCrit"];
	self.playerDamaged = playerDamaged;
	
	hp		= other.e_hp;
	maxhp	= other.e_maxhp;
	self.target	= target;							
}

if(instance_exists(target) && ds_exists(target.statmap,ds_type_map) && object_is_ancestor(target.object_index,obj_enemy)){
	with(instance_create_layer(target.x, target.y, "dmgTxt", obj_minihpbar)){
		hp		= other.e_hp;
		maxhp	= other.e_maxhp;
		hpwidth	= target.sprite_width;
		self.target	= target.id;
	}
}
atkmap[? "isCrit"]			= false;

if(ds_map_exists(atkmap,"isPiercing") && ds_map_exists(atkmap,"isProjectile")){
	if(!atkmap[? "isPiercing"]){
		ds_map_destroy(atkmap);
		atkmap = -1;
		instance_destroy();
	}
}

