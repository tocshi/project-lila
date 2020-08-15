event_inherited();

// face the target
if(instance_exists(target)) {
	image_angle = point_direction(x, y, target.x, target.y);
}

// movement

if((point_distance(x, y, dest_x, dest_y) < statmap[? "movespeed"]) && !is_unburrowing){
	if (is_burrowed) {
		alarm[6] = 1;
	}
	if (alarm[3] < 0 && target != noone && !has_attacked) {
		alarm[3] = ACQUIRE_TARGET_TIME;
		has_attacked = true
	}
}

if(is_burrowed){
	movedir = point_direction(x, y, dest_x, dest_y);
	move(statmap[? "movespeed"], movedir);
}

// Stop movement if can't move or not moving at movespeed (e.g. hit a wall), or timeout
if((x == xprevious && y == yprevious) || (point_distance(x, y, xprevious, yprevious) + 0.1 < statmap[? "movespeed"]) || tick - start_moving_tick > MAX_BURROW_TICKS && !is_unburrowing){
	if (is_burrowed) {
		alarm[6] = 1;
	}
	if (alarm[3] < 0 && target != noone && !has_attacked) {
		alarm[3] = ACQUIRE_TARGET_TIME;
		has_attacked = true
	}
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

if(target == noone || x <= target.x){
	image_xscale = 1;
} else {
	image_xscale = -1;
}
show_debug_message(image_xscale)
tick ++;
