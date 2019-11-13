for(i = 0; i < array_length_1d(skill_sprite); i++){
	var width = sprite_get_width(skill_sprite[i]);
	var height = sprite_get_height(skill_sprite[i]);
	draw_sprite(skill_sprite[i],0,global.hpmpend+(i*80),20);
	
	if(cd[i+1] <= 0){
		draw_set_alpha(0);
	}
	else {
		draw_set_alpha(0.7);
	}
	
	if((cd[i+1]/60) <= 9.9){
		var cdtime = string_format(cd[i+1]/60,1,1);
	}
	else {
		var cdtime = string(round(cd[i+1]/60));
	}
	
	draw_set_font(fnt_dmgtxt);
	draw_set_color(c_white);
	draw_set_halign(fa_center);
	draw_healthbar(global.hpmpend+(i*80), 20, global.hpmpend+(i*80)+width, 20+height, (cd[i+1]/maxcd[i+1])*100, c_dkgray, c_black, c_black, 2, true, false);
	draw_text(global.hpmpend+(i*80)+(width/2),20+(height/4),cdtime); 
	draw_set_alpha(1);
	draw_set_halign(fa_left);
}