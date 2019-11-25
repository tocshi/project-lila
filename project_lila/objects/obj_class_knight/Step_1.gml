event_inherited();

if(statmap[? "classlvl"] >= 2 && statChange){
	statmap[? "fire_def"] += 5;
	statmap[? "ice_def"] += 5;
	statmap[? "lightning_def"] += 5;
	statmap[? "earth_def"] += 5;
	statmap[? "wind_def"] += 5;
	statmap[? "light_def"] += 5;
	statmap[? "dark_def"] += 5;
}

if(statmap[? "classlvl"] >= 6 && statChange){
	origatk = basestatmap[? "atk"];
	origdef = basestatmap[? "def"];
	statmap[? "atk"] += origdef*0.3;
	statmap[? "def"] += origatk*0.3;
	//show_debug_message(statmap[? "atk"]);
	//show_debug_message(statmap[? "def"]);
}

if(shield_charge > 0){
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

if(following_ally && instance_exists(target)){
	direction = point_direction(x,y,target.x,target.y);
	
	if (point_distance(x, y, target.x, target.y) < 15){
		speed = 0;
		isMoving = false;
		following_ally = false;
		
		applyBuff(target,180,true,"Knight's Shield",buff_knights_shield,false,-1,0,spr_debug_wall,"Lorem Ipsum");
		
	}
}