event_inherited();

if(isInArray(skills,"Meditative Training") && statChange){
	statmap[? "maxmp"] += 100;
}

if(isInArray(skills,"Meditative Training") && highRegenThreshold >= 90){
	statmap[? "mp"] += statmap[? "mpregen"]*2;
	if(highRegenThreshold%2==1&&statmap[? "mp"] < statmap[? "maxmp"]){
		with(instance_create_layer(irandom_range(x-32,x+32),irandom_range(y-32,y+32),"Assets_1",obj_skill_meditation)){
			target = other;
		}
	}
}