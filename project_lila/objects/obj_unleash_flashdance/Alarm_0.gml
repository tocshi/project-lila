if(remaining <= 0){
	instance_destroy();
	camera_set_view_target(global.currentCamera,user);
	exit;
	}

sprite_index = spr_attack_flashcut;
mask_index = spr_attack_flashcut;

var xx = user.x;
var yy = user.y;
var attempt = 0;
if(first){
	while(collision_circle(xx,yy,32,obj_wall_parent,true,true) || point_distance(user.x,user.y,xx,yy) < radius/1.5){
		xx = irandom_range(x0-radius,x0+radius);
		yy = irandom_range(y0-radius,y0+radius);
		attempt++;
		if(attempt >= 50){break;}
	}
}
else{
	while(collision_circle(xx,yy,32,obj_wall_parent,true,true) || point_distance(user.x,user.y,xx,yy) < radius*1.5){
		xx = irandom_range(x0-radius,x0+radius);
		yy = irandom_range(y0-radius,y0+radius);
		attempt++;
		if(attempt >= 50){break;}
	}
}

if(remaining <= 1){
	var xx = x0;
	var yy = y0;
}



var dist = point_distance(user.x,user.y,xx,yy);
var dir = point_direction(user.x,user.y,xx,yy);
user.atkTimer += 3;
user.canMove = false;
user.canAttack = false;
user.canUseSkill = false;
user.isMoving = false;
image_xscale = dist;
image_yscale = 1.6;
image_alpha = 0.6;
image_angle = dir;

user.x = xx;
user.y = yy;

var this = self.id;
with(instance_create_layer(user.x,user.y,"Attacks",obj_unleash_flashdance)){
	user = this.user;
	atkmap[? "dmgmod"] = this.atkmap[? "dmgmod"];
	alarm[0] = 3;
	x0 = this.x0;
	y0 = this.y0;
	remaining = this.remaining-1;
}	


