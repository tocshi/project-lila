event_inherited();

// movement
if(canMove && !isSpawning && !isMoving && !attacking && canAttack){
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
		
		if(point_distance(x,y,nearest.x,nearest.y) < 512) {
			movedir = point_direction(x,y,nearest.x,nearest.y) + 180;
			var dist = irandom_range(200,260);
			destX = x+lengthdir_x(dist,movedir);
			destY = y+lengthdir_y(dist,movedir);
			canAttack = false;
			atkTimer = dist/statmap[? "movespeed"];
		}
	}
	else if(!instance_exists(target)){
		movedir = irandom(359);
		var dist = irandom_range(16,64);
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
	else if(point_distance(x,y,target.x,target.y) > 128){
		movedir = point_direction(x,y,target.x,target.y);
		var dist = irandom_range(100,140);
		destX = x+lengthdir_x(dist,movedir);
		destY = y+lengthdir_y(dist,movedir);
		canAttack = false;
		atkTimer = dist/statmap[? "movespeed"];
	}
	else if(point_distance(x,y,target.x,target.y) < 128){
		movedir = 0;
		destX = x;
		destY = y;
		canAttack = false;
		atkTimer = room_speed/statmap[? "atkspeed"];
		movedir = point_direction(x,y,target.x,target.y);
		// TODO: implement new rat attack with animation
		with(instance_create_layer(x,y,"Attacks",obj_enemy_attack_tackle)){
			user = other;
			mask_index = other.mask_index;
			ds_map_copy(atkmap,user.statmap);
			atkmap[? "dmgmod"]			= 100;

			atkmap[? "element"]			= "none";
			atkmap[? "isSingleHit"]		= true;
			
			skill = (room_speed/atkmap[? "atkspeed"])/3;
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
}
else{
	target = noone;
	aggrorange = aggrorange_orig;
}