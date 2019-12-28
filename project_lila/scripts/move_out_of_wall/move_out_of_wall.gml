// Become unstuck from a wall
if(!place_free(x,y)){
	if(speed > 0){
		move_outside_solid(direction+180,speed);
	}
	else{
		var wall = instance_place(x,y,obj_wall_parent);
		move_outside_solid(point_direction(wall.x,wall.y,x,y),10);
	}
}