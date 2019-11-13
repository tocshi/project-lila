if(ds_list_find_index(hitList,other.id) == -1){

	if(buffed){
		applyBuff(other.id,room_speed*2,false,"Stunned",cc_stun,false,-1,0,spr_debug_wall,"Lorem Ipsum");
	}
	
	else{
		applyBuff(other.id,room_speed*0.8,false,"Stunned",cc_stun,false,-1,0,spr_debug_wall,"Lorem Ipsum");
	}

	var stunEffect = instance_create_layer(other.x,other.y,"Assets_1",obj_stun_effect);
	stunEffect.user = other.id;
}
event_inherited();

