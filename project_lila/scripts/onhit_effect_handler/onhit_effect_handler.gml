var user = argument0;
var target = argument1;

switch(user.statmap[? "class"]){
	case "Archer":
		if(user.statmap[? "classlvl"] >= 7){
			if(atkmap[? "isCrit"]){
				user.statmap[? "mp"] += 5;
			}
		}
		break;
		
	default:
		break;
}