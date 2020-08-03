event_inherited();

if(other.canKnockback){
	// TODO: make these into functions when 2.3 comes
	other.atkTimer += max(0,10-other.atkTimer);
	other.alarm[1] = 10;
	other.direction = point_direction(x,y,other.x,other.y);
	other.speed = 5;
	other.canMove = false;
	other.canAttack = false;
}