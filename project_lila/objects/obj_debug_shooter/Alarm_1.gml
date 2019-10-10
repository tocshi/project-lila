if(canAttack){
	var skillobj = instance_create_layer(x,y,"Attacks",obj_enemy_attack_ball);
	skillobj.attacker = self.id;
	skillobj.direction = direction;
	skillobj.image_blend = c_purple;
}
alarm[1] = room_speed*2;