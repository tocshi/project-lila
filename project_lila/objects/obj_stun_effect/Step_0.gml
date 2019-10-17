if(user == 0){exit;}


x = user.x;
y = user.y-(user.sprite_height/2);
if (!hasBuff(user,"Stunned")){instance_destroy();}