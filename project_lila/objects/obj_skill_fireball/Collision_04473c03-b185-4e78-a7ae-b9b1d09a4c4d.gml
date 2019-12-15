var burndmg = ceil(max(atkmap[? "fire_atk"],atkmap[? "atk"] / 10));
applyBuff(other,10*room_speed,true,"Burn",buff_generic,false,1,5,spr_buff_burning,"You're on fire!",burndmg);
event_inherited();