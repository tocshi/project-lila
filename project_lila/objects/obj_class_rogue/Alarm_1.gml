alpha = 1;
mask_index = spr_debug_player;
if(!instance_exists(s_step_target)){exit;}

with(instance_create_layer(s_step_target.x,s_step_target.y,"Attacks",obj_skill_shadow_step)){
	user = other;
	target = other.s_step_target;
	atkmap[? "dmgmod"]		= 260;
	atkmap[? "element"]		= "none";
	image_xscale = 2*(target.sprite_width/64);
	image_yscale = target.sprite_height/64;
}
var dir = point_direction(x,y,s_step_target.x,s_step_target.y);
x = s_step_target.x + 40 * dcos(dir);
y = s_step_target.y - 40 * dsin(dir);

