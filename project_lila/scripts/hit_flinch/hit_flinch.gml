target = argument0;
dir = argument1;
amount = argument2;

if(amount <= 1){
	target.speed = 0;
	exit;
}

target.speed = amount;
target.direction = dir;

