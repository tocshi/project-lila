switch(sprite_index){
	case spr_poison_trap:
	collision_circle_list(x,y,128,obj_enemy,true,false,poison_targets,false);
	for(var i = 0; i < ds_list_size(poison_targets); ++i){
		applyBuff(poison_targets[| i],6*room_speed,true,"Poisoned",buff_generic,false,3,10,spr_buff_burning,"You're poisoned!",floor(user.basestatmap[? "atk"]*0.05));
		if(poison_targets[| i].statmap[? "hp"] >= poison_targets[| i].statmap[? "maxhp"]*0.9 && user.statmap[? "classlvl"] >= 8){
			applyBuff(user,10*room_speed,true,"Punish the Strong",buff_generic,false,1,1,spr_buff_TODO,"Lorem Ipsum",0);
		}
	}
	break;
	
	case spr_shock_trap:
	var target = instance_nearest(x,y,obj_enemy);
	applyBuff(target,120,false,"Stunned",cc_stun,false,1,1,spr_debug_wall,"Stunned! Can't do anything!",0);
	var stunEffect = instance_create_layer(other.x,other.y,"Assets_1",obj_stun_effect);
	stunEffect.user = target;
	break;
	
	default:
	show_error("Rogue Trap has no sprite!",false);
}

mask_index = spr_empty;
triggered = true;
skill = 30;
