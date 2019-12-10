var burndmg = ceil(max(atkmap[? "fire_atk"] * (atkmap[? "dmgmod"]/100),atkmap[? "atk"] * (atkmap[? "dmgmod"]/1000)));
applyBuff(other,10*room_speed,true,"Burn",buff_generic,false,1,5,spr_debug_indicator,"You're on fire!",burndmg);
event_inherited();