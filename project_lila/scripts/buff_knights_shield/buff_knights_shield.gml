var target = argument0;

target.isBlocking = false;
target.statmap[? "finalshld"] -= 50;

if(variable_instance_exists(target, "shield_charge")){
	if(target.shield_charge){
		speed = 0; 
		isMoving = false;
		shield_charge = false;
	}
}


