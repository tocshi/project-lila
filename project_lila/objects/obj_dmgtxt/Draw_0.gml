draw_set_halign(fa_center);
draw_set_valign(fa_bottom);
draw_set_color(c_white);
if(isCrit){
	draw_set_color(c_yellow);
}
if(isOrangeCrit){
	draw_set_color(c_orange);
}
if(isRedCrit){
	draw_set_color(c_red);
}
draw_set_alpha(1);
draw_set_font(fnt_hpmp);
draw_text_transformed(x, y, string(damage),1.5,1.5,0);
