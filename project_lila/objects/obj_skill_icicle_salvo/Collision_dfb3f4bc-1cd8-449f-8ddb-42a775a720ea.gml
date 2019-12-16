var orig_dmgmod = atkmap[? "dmgmod"];
if(ds_list_find_index(user.i_salvo_hitList,other) != -1){atkmap[? "dmgmod"] *= 0.25;}
applyBuff(other,60,true,"Chilled",buff_generic,false,1,1,spr_buff_chilled,"The cold slows you down!",0);
event_inherited();
ds_list_add(user.i_salvo_hitList,other);
atkmap[? "dmgmod"] = orig_dmgmod;
