draw_set_halign(fa_center);
draw_set_valign(fa_bottom);
draw_set_color(c_white);
var dmgtxt = damage;
if(isCrit){
	draw_set_color(c_yellow);
	dmgtxt = string(damage) + " !";
}
if(isOrangeCrit){
	draw_set_color(c_orange);
	dmgtxt = string(damage) + " !!";
}
if(isRedCrit){
	draw_set_color(c_red);
	dmgtxt = string(damage) + " !!!";
}
if(playerDamaged){
	draw_set_color(c_purple);
}
if(allyDamaged){
	draw_set_color(c_blue);
}
draw_set_alpha(1);
draw_set_font(fnt_dmgtxt);
//draw_text_transformed(x, y, string(damage),1.5,1.5,0);
draw_text_outlined(x, y, c_black, draw_get_color(), dmgtxt);
