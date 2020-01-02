if(global.pause){
	var x0 = camera_get_view_x(global.currentCamera);
	var y0 = camera_get_view_y(global.currentCamera);
	switch(global.gui_state){
		case 0:
		draw_set_alpha(1);
		draw_sprite(gui_inv,-1,x0,y0);
		// draw stats
		draw_set_font(fnt_gui_small);
		for(var i = 0; i < 24; ++i){
			var xx = x0 + invStatLocation[i,0];
			var yy = y0 + invStatLocation[i,1];
			var spr_stat = spr_stat_atk + i;
			draw_sprite(spr_stat,-1,xx,yy);
			draw_set_halign(fa_left);
			draw_set_valign(fa_top);
			draw_set_color(c_black);
			if(global.equipStats[| i] == "hpregen" || global.equipStats[| i] == "mpregen"){
				draw_text(xx,yy-4, "   " + string(room_speed*global.player.statmap[? global.equipStats[| i]]));
			}
			else{draw_text(xx,yy-4, "   " + string(global.player.statmap[? global.equipStats[| i]]));}		
		}
		break;
	}
}

draw_set_color(c_white);