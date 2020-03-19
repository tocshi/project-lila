var entity = argument0
var damage = argument1
if (damage < 0) {
	damage = 0;	
}
with (entity) {
	statmap[? "hp"] -= damage;
	event_user(0);
}