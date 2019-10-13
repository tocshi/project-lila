if(instance_exists(target)){
	draw_set_alpha(1);
	draw_healthbar((target.x-abs(hpwidth)), (target.y)-10-(target.sprite_height/2), (target.x+abs(hpwidth)), (target.y)-5-(target.sprite_height/2), (target.statmap[? "hp"]/target.statmap[? "maxhp"])*100, c_black, c_lime, c_lime, 0, true, true);
}
