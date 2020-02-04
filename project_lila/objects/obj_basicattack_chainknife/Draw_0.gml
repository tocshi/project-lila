draw_self();
// chain
draw_sprite_ext(
	spr_basic_chain,
	0,
	x,
	y,
	point_distance(x,y,user.x,user.y)/sprite_get_width(spr_basic_chain),
	1,
	point_direction(x,y,user.x,user.y),c_white,
	1);
