switch(room){

	case rm_title:
		draw_set_font(fnt_menutitle);
		draw_set_halign(fa_center);
		draw_set_color(c_white);
		draw_text(room_width/2, room_height/3, "PROJECT LILA VERSION: TOO DAMN EARLY!\n PRESS ENTER TO CONTINUE\n\nSkill buttons: Q W E R T A S D F G\n\nTab to reset cooldowns\n Shift for infinite MP");
		break;
	case rm_playerdeath:
		draw_set_font(fnt_menutitle);
		draw_set_halign(fa_center);
		draw_set_color(c_red);
		draw_text(room_width/2, room_height/3, "YOU DIED\n\nThis isn't Dark Souls though,\n press Enter to go back.");
		break;
}
//move this to a separate object layered on top of items
if(global.pause){
	draw_set_alpha(0.5);
	draw_sprite(paused_state,-1,camera_get_view_x(global.currentCamera),camera_get_view_y(global.currentCamera));
	draw_set_alpha(1);
	draw_sprite(gui_inv,-1,camera_get_view_x(global.currentCamera),camera_get_view_y(global.currentCamera));
	
	var invSpace = 0;
	for(var i = 0; i < ds_list_size(global.itemData) && invSpace < 100; i++){
		if(global.playerItems[i] > 0){
		
			draw_set_halign(fa_right);
			draw_set_valign(fa_bottom);
			draw_set_color(c_black);
			draw_set_alpha(1);
			draw_set_font(fnt_gui_small);
			draw_text_outlined(camera_get_view_x(global.currentCamera)+global.invItemBox[invSpace,0]+64,
					camera_get_view_y(global.currentCamera)+global.invItemBox[invSpace,1]+69,
					c_black,c_white,
					string(global.playerItems[i]));
					
			draw_set_halign(fa_left);
			draw_set_valign(fa_top);
			invSpace++;
		}
	}
}

draw_set_color(c_white);