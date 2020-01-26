if(user == noone){exit;}

if (!hasBuff(user,"Taunt") || !instance_exists(user)){
	instance_destroy();
	exit;
}
x = user.x-(user.sprite_width/2);
y = user.y-(user.sprite_height/2);
