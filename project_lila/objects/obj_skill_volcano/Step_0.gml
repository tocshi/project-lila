skill--;
if(skill == room_speed*6){image_speed = 0;}


if(!fading){
	if(skill <= 0){
		fading = true;
		alarm[0] = 40;
		image_speed = -1;
	}
	if(skill < room_speed*6){
		var roll = random_range(0,100);
		if(roll < 3){
			with(instance_create_layer(x,y,"Attacks",obj_skill_volcano_shot)){
				self.user = other.user;
				ds_map_copy(atkmap,user.statmap);
				atkmap[? "dmgmod"]		= 130;
				atkmap[? "element"]		= "fire";
			}
		}
	}
}
else{
	image_alpha-=1/40;
}

