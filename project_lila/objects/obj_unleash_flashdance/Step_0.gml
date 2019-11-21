if(alarm_get(0) > 0){exit;}

skill--;
image_alpha -= 0.01;
if(image_alpha <= 0){instance_destroy();}