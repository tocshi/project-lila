/// @description Insert description here
// You can write your code in this editor

draw_set_halign(halign);
draw_set_valign(valign);
draw_set_color(background_clr);
draw_set_alpha(background_alpha)

boxY = y;
if (valign == fa_center) {
	boxY -= height/2; 	
} else if (valign == fa_bottom) {
	boxY -= height;	
}

draw_roundrect_ext(x, boxY, x + width, boxY + height, x_round_radius, y_round_radius, false);

draw_set_halign(halign);
draw_set_valign(valign);
draw_set_color(color);
draw_set_alpha(alpha);
draw_set_font(font);
var drawText = string_wrap(text, (width -  2 * x_margin));

draw_text_outlined_transformed(x + x_margin, y + y_margin, c_black, draw_get_color(), drawText,1,1,0);