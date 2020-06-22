if(instance_exists(target)){
	draw_set_alpha((60-dist)/60);
	draw_healthbar((target.x-abs(hpwidth/2)), (target.y)-10-(target.sprite_height/2), (target.x+abs(hpwidth/2)), (target.y)-5-(target.sprite_height/2), (hp/maxhp)*100, c_black, c_red, c_red, 0, true, true);
	draw_set_alpha(1);
}

