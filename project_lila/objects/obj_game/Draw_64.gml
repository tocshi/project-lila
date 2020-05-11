switch(room){

	case rm_title:
		draw_set_font(fnt_menutitle);
		draw_set_halign(fa_center);
		draw_set_valign(fa_top);
		draw_set_color(c_white);
		draw_set_alpha(1);
		draw_text(room_width/2, room_height/4, "PROJECT LILA");
		draw_set_font(fnt_gui_medium);
		draw_text(room_width/2+160, room_height/4+50, "0.0.6.1");
		draw_set_halign(fa_left);
		break;
	case rm_playerdeath:
		draw_set_font(fnt_menutitle);
		draw_set_valign(fa_top);
		draw_set_halign(fa_center);
		draw_set_color(c_red);
		draw_set_alpha(1);
		draw_text(room_width/2, room_height/3, "YOU DIED\n\nThis isn't Dark Souls though,\n press Enter to go back.");
		draw_set_halign(fa_left);
		break;
	case rm_options:
		draw_set_font(fnt_menutitle);
		draw_set_valign(fa_top);
		draw_set_halign(fa_center);
		draw_set_color(c_white);
		draw_set_alpha(1);
		draw_text(room_width/2, 50, "OPTIONS");
		draw_set_halign(fa_left);
		break;
}

draw_set_color(c_white);
if(debug_mode){
	draw_set_halign(fa_left);
	draw_set_valign(fa_top);
	draw_set_color(c_black);
	draw_set_font(fnt_gui_medium);
	draw_text(1550,10,round(fps));
}

