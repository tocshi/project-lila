if(global.gui_state == 0 && global.pause == 1){
	exit;
}
instance_destroy();

if(anchor == 0 || !instance_exists(anchor)){exit;}

x = anchor.x; 
y = anchor.y;

