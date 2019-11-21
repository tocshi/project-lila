var modifier = argument0;
var delay = argument1;

var addhits = 0;
if(modifier >= 3){addhits+=4;}
else if(modifier >= 2.5){addhits+=3;}
else if(modifier >= 2){addhits+=2;}
else if(modifier >= 1.5){addhits+=1;}
with(instance_create_layer(x,y,"Attacks",obj_unleash_flashdance)){
	user = global.player;
	atkmap[? "dmgmod"] *= modifier;
	alarm[0] = delay;
	x0 = x;
	y0 = y;
	remaining += addhits*2;
	first = true;
}

camera_set_view_target(global.currentCamera,noone);
