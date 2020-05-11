event_inherited();

if(isInArray(skills,"All-Rounder") && statChange){
	origatk = basestatmap[? "atk"];
	origdef = basestatmap[? "def"];
	statmap[? "atk"] += origdef*0.3;
	statmap[? "def"] += origatk*0.3;
}
else{
	statChange = true;
}

if(shield_charge > 0){
	xx = x+lengthdir_x(15,charge_direction);
	yy = y+lengthdir_y(15,charge_direction);
	if(place_free(xx,yy)){
		x = xx;
		y = yy;
	}
	shield_charge--;
	if(shield_charge <= 0){
		speed = 0; 
		isMoving = false;
	}	
}

if(footwork_charge > 0){
	footwork_charge--;
	if(footwork_charge <= 0){
		speed = 0; 
		isMoving = false;
	}	
}

if(following_ally && instance_exists(guardian_target)){
	direction = point_direction(x,y,guardian_target.x,guardian_target.y);
	
	if (point_distance(x, y, guardian_target.x, guardian_target.y) < 15){
		speed = 0;
		isMoving = false;
		following_ally = false;
		
		applyBuff(guardian_target,180,true,"Knight's Shield",buff_knights_shield,false,-1,0,spr_debug_wall,"Lorem Ipsum",0);
		
	}
}