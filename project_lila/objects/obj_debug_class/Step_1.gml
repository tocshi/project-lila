event_inherited();

if(shield_charge > 0){
	shield_charge--;
	if(shield_charge <= 0){
		speed = 0; 
		isMoving = false;
		shield_charge = false;
	}	
}

if(following_ally && instance_exists(target)){
	direction = point_direction(x,y,target.x,target.y);
	
	if (point_distance(x, y, target.x, target.y) < 15){
		speed = 0;
		isMoving = false;
		following_ally = false;
		
		applyBuff(target,180,true,"Knight's Shield",buff_knights_shield,false,-1,0);
		
	}
}

