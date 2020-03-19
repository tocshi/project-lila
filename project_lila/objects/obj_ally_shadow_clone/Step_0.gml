if(point_distance(x,y,user.x,user.y) > 40){
	move(user.statmap[? "movespeed"],point_direction(x,y,user.xprevious,user.yprevious));
}
if(collision_line(x,y,user.x,user.y,obj_wall_parent,true,true)){
	lost++;
}
if(lost > 60){
	lost = 0;
	x = irandom_range(user.x-40,user.x+40);
	y = irandom_range(user.y-40,user.y+40);
}
deal_damage(self, (1/(room_speed*30))*statmap[? "maxhp"]);
event_inherited();

