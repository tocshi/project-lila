draw_set_alpha(dist/60);
draw_healthbar((x-target.sprite_width), (y)-10, (x+target.sprite_width), (y)-5, (hp/maxhp)*100, c_black, c_red, c_red, 0, true, true);
draw_set_alpha(1);