event_inherited();

// handle shield state updates
if(shield_cooldown > 0) {
	shield_cooldown--;
}

// movement
if(canMove && !isSpawning && !isMoving && canAttack){
	if (statmap[? "hp"] < statmap[? "maxhp"]/2 && shield_cooldown <= 0) {
		applyBuff(id,shield_duration,true,"Rock Hardened",buff_generic,false,-1,0,spr_empty,"Lorem Ipsum",0)
		shield_cooldown = shield_cooldown_orig;
		canAttack = false;
		atkTimer = shield_duration+30;
	}
	else if(!instance_exists(target)){
		movedir = irandom(359);
		var dist = irandom_range(128,256);
		destX = x+lengthdir_x(dist,movedir);
		destY = y+lengthdir_y(dist,movedir);
		canAttack = false;
		if(moves_remaining > 1) { 
			atkTimer = irandom_range(room_speed,room_speed)/statmap[? "atkspeed"]/3;
			moves_remaining--;
		} else {
			atkTimer = irandom_range(room_speed-5,room_speed+10)/statmap[? "atkspeed"]*3;
			moves_remaining = 4;
		}
	}
	else if(point_distance(x,y,target.x,target.y) > 64){
		movedir = point_direction(x,y,target.x,target.y);
		var dist = irandom_range(100,140);
		destX = x+lengthdir_x(dist,movedir);
		destY = y+lengthdir_y(dist,movedir);
		canAttack = false;
		if(moves_remaining > 1) { 
			atkTimer = irandom_range(room_speed,room_speed)/statmap[? "atkspeed"]/3;
			moves_remaining--;
		} else {
			atkTimer = irandom_range(room_speed-5,room_speed+10)/statmap[? "atkspeed"]*3;
			moves_remaining = 4;
		}
	}
	else if(point_distance(x,y,target.x,target.y) < 64){
		alarm[2] = 15;
		canAttack = false;
		atkTimer = room_speed/statmap[? "atkspeed"];
		instance_create_layer(x,y-sprite_height,"dmgtxt",obj_exclamation_effect);
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