if(anchor == 0){exit;}

draw_set_halign(fa_right);
draw_set_valign(fa_bottom);
draw_set_color(c_black);
draw_set_alpha(1);
draw_set_font(fnt_gui_small);
draw_text_outlined(x+64,y+69,c_black,c_white,string(global.playerItems[anchor.itemid]));
					
draw_set_halign(fa_left);
draw_set_valign(fa_top);