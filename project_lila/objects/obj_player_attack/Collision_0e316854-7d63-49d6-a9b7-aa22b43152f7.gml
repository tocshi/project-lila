if(ds_map_exists(atkmap,"isPiercing") && ds_map_exists(atkmap,"isProjectile") && !gateOfWind){
	
	if(ds_map_exists(atkmap,"range")){skill = (atkmap[? "range"]/speed)/2;} 
	speed *= 2;
	atkmap[? "isPiercing"] = true;
	atkmap[? "dmgmod"]		*= 1.1;
	atkmap[? "critrate"]	+= 20;
	gateOfWind = true;
	image_blend = c_ltgray;
}