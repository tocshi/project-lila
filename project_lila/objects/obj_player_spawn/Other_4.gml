var xx = x;
var yy = y;
var index = findArrayIndex(lastDoor,global.lastDoor);
if(index >= 0){
	xx = spawn_x[index];
	yy = spawn_y[index];
}

with(instance_create_layer(xx,yy,"Instances",global.lastClass)){
	global.player = id;
}
restore_player_equips();