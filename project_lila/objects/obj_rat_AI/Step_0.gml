event_inherited();

// movement
if(canMove && !isSpawning && !isMoving && canAttack){
	if(statmap[? "hp"] < statmap[? "maxhp"] * 0.2) {
		// move away from nearest player/ally when at low hp
		movedir = point_direction(x,y,target.x,target.y) + 180;
		var dist = irandom_range(200,260);
		destX = x+lengthdir_x(dist,movedir);
		destY = y+lengthdir_y(dist,movedir);
		canAttack = false;
		atkTimer = room_speed/statmap[? "atkspeed"];
	}
	else if(!instance_exists(target)){
		movedir = irandom(359);
		var dist = irandom_range(32,128);
		destX = x+lengthdir_x(dist,movedir);
		destY = y+lengthdir_y(dist,movedir);
		canAttack = false;
		atkTimer = irandom_range(room_speed-5,room_speed+10)/statmap[? "atkspeed"];
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