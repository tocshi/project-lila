user = argument0;
sptarget = argument1;
var rate = argument2;

if(user.statmap[? "class"] != "Archer" || user.statmap[? "classlvl"] < 10){exit;}

var roll = random_range(0,100);

if(roll < rate){
	var xx = sptarget.x;
	var yy = sptarget.y;
	var radius = 240;
	while(point_distance(sptarget.x,sptarget.y,xx,yy) < radius-5 || point_distance(sptarget.x,sptarget.y,xx,yy) > radius+5){
		xx = irandom_range(sptarget.x-radius,sptarget.x+radius);
		yy = irandom_range(sptarget.y-radius,sptarget.y+radius);
	}
	with(instance_create_layer(xx,yy,"Attacks",obj_skill_stormpiercer)){
		user = other.user;
		target = other.sptarget;
		ds_map_copy(atkmap,user.statmap);
		atkmap[? "dmgmod"] = 130;
		atkmap[? "element"] = other.user.atkelement;
		image_angle = point_direction(x,y,target.x,target.y);
	}
}