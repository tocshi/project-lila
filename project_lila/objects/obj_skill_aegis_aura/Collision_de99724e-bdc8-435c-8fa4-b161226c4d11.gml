if(time%60 != 0){exit;}

applyBuff(other.id,600,true,"Aegis Aura",buff_generic,false,-1,0,spr_buff_aegis_aura,"Lorem Ipsum");
var target = other.id;
with(instance_create_layer(target.x,target.y,"Attacks",obj_skill_aegis_aura_effect)){user = target;}
