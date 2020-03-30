var xx = argument0;
var yy = argument1;
var cd = argument2;
var maxcd = argument3;

var width = 64;
var height = 64;

if(cd <= 0){exit;}
	
if((cd/60) <= 9.9){
	var cdtime = string_format(cd/60,1,1);
}
else {
	var cdtime = string(round(cd/60));
}

draw_set_alpha(0.6);
draw_set_font(fnt_dmgtxt);
draw_set_color(c_white);
draw_set_halign(fa_center);
draw_healthbar(xx, yy, xx+width, yy+height, (cd/maxcd)*100, $55464F, c_black, c_black, 2, true, false);
draw_set_alpha(0.9);
draw_set_valign(fa_top);
draw_text_outlined(xx+(width/2),yy+(height/4), c_black, c_white, cdtime); 

//TODO: graphical indicator
if(cd == 1){}

//reset draw settings
draw_set_alpha(1);
draw_set_halign(fa_left);
