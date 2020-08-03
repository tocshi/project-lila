if(!instance_exists(s_slicer_target)){exit;}

atkTimer = 20;
alarm[1] = atkTimer;
canMove = false;
canAttack = false;
canUseSkill = false;
isMoving = false;
s_slicer_remaining--;
if(s_slicer_remaining > 0){
	alarm[7] = 20;
}
var dir = point_direction(x,y,s_slicer_target.x,s_slicer_target.y);
dir = random_range(dir-10,dir+10);
with(instance_create_layer(s_slicer_target.x,s_slicer_target.y,"Attacks",obj_skill_shadow_step)){
	user = other;
	target = other.s_slicer_target;
	atkmap[? "dmgmod"]		= 70;
	atkmap[? "element"]		= "none";
	sprite_index = spr_swift_slicer;
	image_xscale = min(point_distance(user.x,user.y,target.x,target.y)/64,2);
	clamp(image_xscale,0.8,2);
	image_angle = dir;
}
x = s_slicer_target.x + 64 * dcos(dir);
y = s_slicer_target.y - 64 * dsin(dir);