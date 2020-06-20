instance_destroy(obj_player);

var xx = x;
var yy = y;
var index = findArrayIndex(lastDoor,global.lastDoor);
if(index >= 0){
	xx = spawn_x[index];
	yy = spawn_y[index];
}

instance_create_layer(xx,yy,"Instances",global.lastClass);
restore_player_equips();