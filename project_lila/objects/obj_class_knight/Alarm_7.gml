if(atkTimer > 0){
	speed = 0;
	exit;
}

direction += 180;
speed = 15;

if(protective_footwork_mod == 400){
	footwork_charge = 25;
}
else if(protective_footwork_mod == 240){
	footwork_charge = 15;
}
else{
	footwork_charge = 10;
}

var skillobj = instance_create_layer(x,y,"Attacks",obj_skill_protective_footwork);
skillobj.atkmap[? "dmgmod"] = protective_footwork_mod;
skillobj.atkmap[? "element"] = atkelement;
skillobj.user = self.id;