// FOR DEBUGGING
if(image_alpha > 0){draw_self();}

draw_set_halign(fa_center);
draw_set_valign(fa_bottom);
draw_set_color(c_white);
var scalemod = 0;
var dmgtxt = damage;
if(isCrit){
	draw_set_color(c_yellow);
	dmgtxt = string(damage) + " !";
	scalemod = 0.1;
}
if(isOrangeCrit){
	draw_set_color(c_orange);
	dmgtxt = string(damage) + " !!";
	scalemod = 0.2;
}
if(isRedCrit){
	draw_set_color(c_red);
	dmgtxt = string(damage) + " !!!";
	scalemod = 0.4;
}
if(playerDamaged){
	draw_set_color(c_purple);
}
if(allyDamaged){
	draw_set_color(c_purple);
}
draw_set_alpha(1);
draw_set_font(fnt_dmgtxt);
//draw_text_transformed(x, y, string(damage),1.5,1.5,0);
var scale = (0.5 + scalemod) * sin((pi/40)*dist) + (0.5 + scalemod);
draw_text_outlined_transformed(x, y-1*dist, c_black, draw_get_color(), dmgtxt, scale, scale,0);
