sprite_index = global.player.sprite_index;
image_xscale = 10;
image_yscale = 10;
image_alpha = 0.5;
direction = 180;
speed = 0;

width = camera_get_view_width(global.currentCamera);
height = camera_get_view_height(global.currentCamera);
x = camera_get_view_x(global.currentCamera) + (width*1.1);
y = camera_get_view_y(global.currentCamera) + (height/2);

time = 100;
duration = time;
