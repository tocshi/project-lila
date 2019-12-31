var adddmg = 0;

with(other){
	var distmod = 1/max(distance_to_point(other.user.x,other.user.y),20);
	clamp(distmod,1/50,1/20);
	if(distmod <= 1/50){distmod=0;}
	distmod*=1000;
	adddmg+=distmod;
}
if(other.target != user){adddmg+=60;}
if(hasBuff(other,"Poisoned")){
	if(get_buff_data(other,"Poisoned","stacks") >= 5){
		adddmg+=40;
	}
}
atkmap[? "dmgmod"]+=adddmg;
event_inherited();
atkmap[? "dmgmod"]-=adddmg;
