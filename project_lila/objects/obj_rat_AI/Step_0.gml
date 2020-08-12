event_inherited();

// movement
if(canMove && !isSpawning && !isMoving && canAttack){
	if(retreating) {
		// move away from nearest player/ally when at low hp
		var nearest_player = instance_nearest(x,y,obj_player);
		var nearest_ally = instance_nearest(x,y,obj_ally);
		var nearest = noone;
		if(instance_exists(nearest_player) && instance_exists(nearest_ally)){
			if(point_distance(x,y,nearest_player.x,nearest_player.y) < point_distance(x,y,nearest_ally.x,nearest_ally.y)){
				nearest = nearest_player;
			}
			else{
				nearest = nearest_ally;
			}
		}
		else if(!instance_exists(nearest_ally)){
			nearest = nearest_player;
		}
		else if(!instance_exists(nearest_player)){
			nearest = nearest_ally;
		}
		
		if(point_distance(x,y,nearest.x,nearest.y) < 512 && atkTimer <= 0){
			movedir = point_direction(x,y,nearest.x,nearest.y) + 180 + random_range(-35,35);
			var dist = irandom_range(64,128);
			destX = x+lengthdir_x(dist,movedir);
			destY = y+lengthdir_y(dist,movedir);
			canAttack = false;
			atkTimer = dist/2.5;
		}
	}
	else if(!instance_exists(target)){
		movedir = irandom(359);
		var dist = irandom_range(24,256);
		destX = x+lengthdir_x(dist,movedir);
		destY = y+lengthdir_y(dist,movedir);
		canAttack = false;
		if(idle_moves_remaining > 1) { 
			atkTimer = irandom_range(room_speed,room_speed)/statmap[? "atkspeed"]/3;
			idle_moves_remaining--;
		} else {
			atkTimer = irandom_range(room_speed-5,room_speed+10)/statmap[? "atkspeed"]*3;
			idle_moves_remaining = irandom_range(2, 5);
		}
	}
	// if within attack range
	else if(point_distance(x,y,target.x,target.y) < 64){
		alarm[2] = 15;
		canAttack = false;
		atkTimer = room_speed/statmap[? "atkspeed"];
		instance_create_layer(x,y-sprite_height,"dmgtxt",obj_exclamation_effect);
	}
	// if not within attack range
	else if(point_distance(x,y,target.x,target.y) > 64){
		movedir = point_direction(x,y,target.x,target.y)+random_range(-10,10);
		var dist = irandom_range(100,140);
		destX = x+lengthdir_x(dist,movedir);
		destY = y+lengthdir_y(dist,movedir);
		canAttack = false;
		atkTimer = dist/statmap[? "movespeed"];
		// dashes
		if(idle_moves_remaining > 1) { 
			idle_moves_remaining--;
		} else {
			atkTimer = (room_speed/statmap[? "atkspeed"]);
			idle_moves_remaining = irandom_range(2, 5);
		}
	}
	isMoving = true;
}

if((point_distance(x, y, destX, destY) < statmap[? "movespeed"] && isMoving)){
	isMoving = false;
}

if(isMoving && canMove && !canAttack){
	move(statmap[? "movespeed"], movedir);
}

// Stop movement if can't move or moving away from dest
if((x == xprevious && y == yprevious) || (point_distance(x,y,destX,destY) > point_distance(xprevious,yprevious,destX,destY))){
	isMoving = false;
}

// target acquired
var next_target = noone;
if(instance_exists(lastHitBy)){
	next_target = lastHitBy;
}
if(aggro && instance_exists(next_target) && point_distance(x,y,next_target.x,next_target.y) < aggrorange){
	target = next_target;
	//image_blend = c_red;
}
else{
	target = noone;
	aggrorange = aggrorange_orig;
	lastHitBy = noone;
	//image_blend = c_white;
}