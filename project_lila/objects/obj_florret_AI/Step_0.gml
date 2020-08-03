event_inherited();

// movement
if(canMove && !isSpawning && !isMoving && canAttack){
	if(!instance_exists(target)){
		movedir = irandom(359);
		var dist = irandom_range(64,128);
		destX = x+lengthdir_x(dist,movedir);
		destY = y+lengthdir_y(dist,movedir);
		canAttack = false;
		atkTimer = num_atks/statmap[? "atkspeed"];
	}
	else if(point_distance(x,y,target.x,target.y) > 128){
		movedir = point_direction(x,y,target.x,target.y);
		var dist = irandom_range(100,140);
		destX = x+lengthdir_x(dist,movedir);
		destY = y+lengthdir_y(dist,movedir);
		canAttack = false;
		atkTimer = room_speed/statmap[? "atkspeed"];
	}
	else if(point_distance(x,y,target.x,target.y) < 128){
		movedir = point_direction(x,y,target.x,target.y);
		destX = x+lengthdir_x(irandom_range(190,210),movedir);
		destY = y+lengthdir_y(irandom_range(190,210),movedir);
		canAttack = false;
		atkTimer = room_speed/statmap[? "atkspeed"];
		movedir = point_direction(x,y,target.x,target.y);
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
	var movemod = point_distance(x,y,destX,destY)/64
	movemod = clamp(movemod,0.1,3);
	move(statmap[? "movespeed"]*movemod, movedir);
}

// Stop movement if can't move or moving away from dest
if((x == xprevious && y == yprevious) || (point_distance(x,y,destX,destY) > point_distance(xprevious,yprevious,destX,destY))){
	isMoving = false;
}

// target acquired
var next_target_player = instance_nearest(x,y,obj_player);
var next_target_ally = instance_nearest(x,y,obj_ally);
var next_target = noone;
if(instance_exists(next_target_player) && instance_exists(next_target_ally)){
	if(point_distance(x,y,next_target_player.x,next_target_player.y) < point_distance(x,y,next_target_ally.x,next_target_ally.y)){
		next_target = next_target_player;
	}
	else{
		next_target = next_target_ally;
	}
}
else if(!instance_exists(next_target_ally)){
	next_target = next_target_player;
}
else if(!instance_exists(next_target_player)){
	next_target = next_target_ally;
}
if(instance_exists(next_target) && point_distance(x,y,next_target.x,next_target.y) < aggrorange){
	target = next_target;
}
else{
	target = noone;
	aggrorange = aggrorange_orig;
}