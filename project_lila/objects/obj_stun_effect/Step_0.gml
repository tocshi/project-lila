if(user == 0){exit;}

if (!hasBuff(user,"Stunned") || !instance_exists(user)){
	instance_destroy();
	exit;
}
x = user.x;
y = user.y-(user.sprite_height/2);
