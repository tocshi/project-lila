if(instance_exists(target) && instance_exists(anchor)){	
	x = anchor.x;
	y = anchor.y;

	image_angle = point_direction(x,y,target.x,target.y);
	image_xscale = point_distance(x,y,target.x,target.y)/sprite_get_width(spr_chain_lightning);
}
skill--;
image_alpha-=1/60;
if(skill <= 0){instance_destroy();}
