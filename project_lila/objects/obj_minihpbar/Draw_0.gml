if(instance_exists(target)){
	draw_set_alpha(dist/60);
	draw_healthbar((target.x-hpwidth), (target.y)-10-(target.sprite_height/2), (target.x+hpwidth), (target.y)-5-(target.sprite_height/2), (hp/maxhp)*100, c_black, c_red, c_red, 0, true, true);
	draw_set_alpha(1);
}

