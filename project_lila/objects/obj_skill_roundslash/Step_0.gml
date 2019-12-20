if(user == 0){exit;}
x = user.x;
y = user.y;

if(skill >= 0){
	skill--;
	if(skill == 0){
		instance_destroy();
		sprite_delete(sprite);
		exit;
		}
	image_angle -= 24;
	user.direction += 24;
}
