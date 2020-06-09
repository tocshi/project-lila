time++;
x = user.x;
y = user.y;
image_alpha = 0.1 * sin(0.05 * time + (pi/2)) + 0.2;
if((time-1)%60 != 0){exit;}

if(user.statmap[? "mp"] < get_skill_data("Aegis Aura","mpcost")){
	instance_destroy();
	exit;
}

with(user){
	use_skill_mp("Aegis Aura","");
}

applyBuff(user,600,true,"Aegis Aura",buff_generic,false,-1,0,spr_buff_aegis_aura,"Lorem Ipsum",0);
with(instance_create_layer(x,y,"Attacks",obj_skill_aegis_aura_effect)){user = other.user;}
