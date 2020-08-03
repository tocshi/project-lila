if(collision){exit;}

if(collision_point(x,y,obj_wall_parent,true,true)){
	collision = true;
	alarm[1] = 1;
}