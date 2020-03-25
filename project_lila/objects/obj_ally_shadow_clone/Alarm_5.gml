switch(t_fang){
	case 0:
	t_fang++;
	alarm[5] = 8;
	var xx = x + 20 * dcos(direction-80);
	var yy = y - 20 * dsin(direction-80);
	with(instance_create_layer(xx,yy,"Attacks",obj_skill_triple_fangs)){
		user = other.user;
		atkmap[? "dmgmod"]		= 16;
		atkmap[? "element"]		= "none";
		direction = other.direction+10;
		image_angle = direction;
		image_xscale = 0.7;
		image_yscale = 0.7;
	}
	break;
	
	case 1:
	t_fang++;
	alarm[5] = 8;
	var xx = x + 20 * dcos(direction+80);
	var yy = y - 20 * dsin(direction+80);
	with(instance_create_layer(xx,yy,"Attacks",obj_skill_triple_fangs)){
		user = other.user;
		atkmap[? "dmgmod"]		= 16;
		atkmap[? "element"]		= "none";
		direction = other.direction-10;
		image_angle = direction;
		image_xscale = 0.7;
		image_yscale = 0.7;
	}
	break;
	
	case 2:
	with(instance_create_layer(x,y,"Attacks",obj_skill_triple_fangs)){
		user = other.user;
		atkmap[? "dmgmod"]		= 20;
		atkmap[? "element"]		= "none";
		direction = other.direction;
		image_angle = direction;
	}
	break;
	
	default:
	show_error("Invalid switch case!",false);
}
