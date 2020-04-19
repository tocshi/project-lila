var target = argument0
var damage = argument1
damage = max(0,damage);
with (target) {
	statmap[? "hpshield"] -= damage;
	var hpdamage = damage - statmap[? "hpshield"];
	statmap[? "hp"] -= hpdamage;
	event_user(0);
}

e_hp = target.statmap[? "hp"];
e_maxhp = target.statmap[? "maxhp"];

if(variable_instance_exists(self.id,"user")){
	onhit_effect_handler(user,target);
}

var playerDamaged = false;
if(target == global.player || object_is_ancestor(target.object_index,obj_ally)){playerDamaged = true;}
var yy = target.y-(target.sprite_height/3);
var valid = false;
while(collision_point(target.x,yy,obj_dmgtxt,false,true)){
	/*with(instance_nearest(target.x,yy,obj_dmgtxt)){
		if(dist > 20){valid = true;}
	}*/
	if(valid){break;}
	yy-=32;
}
with(instance_create_layer(irandom_range(target.x-10,target.x+10), 
							yy, 
							"dmgTxt", obj_dmgtxt)){
	self.damage = damage;
	if(variable_instance_exists(other,"atkmap")){
		isCrit = other.atkmap[? "isCrit"];
		isOrangeCrit = other.atkmap[? "isOrangeCrit"];
		isRedCrit = other.atkmap[? "isRedCrit"];
	}
	self.playerDamaged = playerDamaged;
	
	hp		= other.e_hp;
	maxhp	= other.e_maxhp;
	self.target	= target;							
}

if(instance_exists(target) && ds_exists(target.statmap,ds_type_map) && object_is_ancestor(target.object_index,obj_enemy)){
	with(instance_create_layer(target.x, target.y, "minihpbar", obj_minihpbar)){
		hp		= other.e_hp;
		maxhp	= other.e_maxhp;
		hpwidth	= target.sprite_width;
		self.target	= target.id;
	}
}