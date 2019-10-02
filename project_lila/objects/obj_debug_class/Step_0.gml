event_inherited();

if(mouse_check_button_pressed(mb_left) && !onCD[0]){
	
	speed = 0;
	isMoving = false;
	canMove = false;
	onCD[0] = true;
	alarm[0] = room_speed/atkspeed;
	
	var basic_attack = instance_create_layer(x,y-32,"Attacks",obj_debug_attacks);
	basic_attack.skill_index = 0;
	basic_attack.atkspeed = self.atkspeed;
}
