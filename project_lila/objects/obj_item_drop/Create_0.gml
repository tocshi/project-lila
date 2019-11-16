itemid = 0;
time = 0;
alarm[0] = 1;
alarm[1] = irandom_range(60,93);
xspd = 0;
while(xspd = 0){xspd = random_range(-2.75,2.75);}
x0 = x;
y0 = y;

fading = false;
flying = true;
collision = false;

if(global.pause){
	instance_deactivate_object(self.id);
}