event_inherited();

if(following_ally && instance_exists(target)){
	direction = point_direction(x,y,target.x,target.y);
	
	if (point_distance(x, y, target.x, target.y) < 15){
		speed = 0;
		isMoving = false;
		following_ally = false;
		
		var buff_array = array_create(6,false);
		buff_array[0] = 180;
		buff_array[1] = true;
		buff_array[2] = "Knight's Shield";
		buff_array[3] = buff_knights_shield;
		buff_array[5] = -1;
		ds_list_add(target.buff,buff_array);
		target.statmap[? "finalshld"] += 50;
		target.isBlocking = true;
	}
}

