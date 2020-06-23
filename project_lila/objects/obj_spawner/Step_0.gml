time++;
if((time % freq == 0 && instance_number(obj_enemy) < cap) || init > 0){
	var enemy = script_execute_array(enemy_array);
	var xx = 0;
	var yy = 0;
	var tries = 0;
	while(true){
		xx = irandom_range(x0,x1);
		yy = irandom_range(y0,y1);
		if(point_distance(xx,yy,global.player.x,global.player.y) > 256 && !instance_exists(collision_circle(xx,yy,64,obj_wall_parent,true,true))){
			break;
		}
		if(tries > 1000){exit;}
		tries++;
	}
	instance_create_layer(xx,yy,"Instances",enemy);
	init--;
}
