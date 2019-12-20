if(global.pause){
	draw_set_alpha(0.5);
	//draw_sprite(paused_state,-1,camera_get_view_x(global.currentCamera),camera_get_view_y(global.currentCamera));
	draw_set_alpha(1);
	draw_sprite(gui_inv,-1,camera_get_view_x(global.currentCamera),camera_get_view_y(global.currentCamera));
}

draw_set_color(c_white);