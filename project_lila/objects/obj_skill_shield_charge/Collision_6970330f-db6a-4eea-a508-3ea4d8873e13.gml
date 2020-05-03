event_inherited();

if(other.canKnockback){
	other.atkTimer = 5;
	other.direction = point_direction(x,y,other.x,other.y);
	other.speed = 5;
	other.canMove = false;
}