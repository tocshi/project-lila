time++;
cap = min(floor(time/600),10);
if(time % 300 == 0 && instance_number(obj_enemy) < cap){
	var enemy = choose(obj_debug_demo_chaser,obj_debug_demo_shooter);
	var xx = 0;
	var yy = 0;
	while(true){
		xx = irandom_range(0,room_width);
		yy = irandom_range(0,room_height);
		if(point_distance(xx,yy,global.player.x,global.player.y) > 800){
			break;
		}
	}
	instance_create_layer(xx,yy,"Instances",enemy);
}
