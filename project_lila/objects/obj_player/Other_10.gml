/// @description Level Up and recalculate base stats

basestatmap[? "maxhp"] = 100 + global.playerLevel*10 + round(sqr(global.playerLevel)/10);
basestatmap[? "hpregen"] = basestatmap[? "maxhp"]/100/60;
statChange = true;
	
// recalculate cpp for all enemies in room
with(obj_enemy){
	event_perform(ev_other,ev_room_start);
}