if(time < 30){image_alpha-= 0.01;}
else{image_alpha+= 0.01;}
time++;
x = user.x;
y = user.y+user.sprite_height/2;
if(!hasBuff(user,"Primordial Mana")){instance_destroy();}
if(time > 60){time = 0;}

