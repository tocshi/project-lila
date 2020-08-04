event_inherited();


// face the target
if(target != noone) {
	direction = point_direction(x, y, target.x, target.y);
}

// movement

if((point_distance(x, y, dest_x, dest_y) < statmap[? "movespeed"])){
	is_burrowed = false;
	image_index = 0;
	alarm[2] = ACQUIRE_TARGET_TIME;
}

if(is_burrowed){
	movedir = point_direction(x, y, dest_x, dest_y);
	var movemod = point_distance(x,y,dest_x, dest_y)/64
	movemod = clamp(movemod,0.1,3);
	move(statmap[? "movespeed"]*movemod, movedir);
}

// Stop movement if can't move or moving away from dest
if((x == xprevious && y == yprevious) || (point_distance(x, y, dest_x, dest_y) > point_distance(xprevious, yprevious, dest_x, dest_y))){
	is_burrowed = false;
	image_index = 0;
	alarm[2] = ACQUIRE_TARGET_TIME;
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