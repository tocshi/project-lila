switch(room){

	case rm_title:
		draw_set_font(fnt_menutitle);
		draw_set_halign(fa_center);
		draw_set_valign(fa_top);
		draw_set_color(c_white);
		draw_set_alpha(1);
		draw_text(room_width/2, room_height/3, "PROJECT LILA VERSION: 0.0.1.0\n PRESS ENTER TO CONTINUE\n\nSkill buttons: Q W E R T A S D F G\n\nTab to reset cooldowns\n Shift for infinite MP");
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
}

draw_set_color(c_white);