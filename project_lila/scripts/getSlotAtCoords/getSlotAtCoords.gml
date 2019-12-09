x_coord = argument0;
y_coord = argument1;

// Equipment pixel positions
global.equipItemBox = array_create(12,[0,0]);
for(var i = 0; i < 4; i++){
	for(var j = 0; j < 3; j++){
		//absolute x and y positions
		global.equipItemBox[(i * 3) + j,0] = 198 + j*86;
		global.equipItemBox[(i * 3) + j,1] = 119 + i*86;
	}
}
// Inventory pixel positions
global.invItemBox = array_create(100,[0,0]);
for(var i = 0; i < 10; i++){
	for(var j = 0; j < 10; j++){
		//absolute x and y positions
		global.invItemBox[(i * 10) + j,0] = 490 + j*66;
		global.invItemBox[(i * 10) + j,1] = 121 + i*66;
	}
}

// item sprites are 64x64

// check whether coordinates are in equip slot area
if (x_coord >= 198 
&& x_coord <= 198 + 3*86 
&& y_coord >= 119 
&& y_coord <= 119 + 4*86) {
		// Floor division by 86, then adjust for offsets
		// Return the slot number
}

// check whether coordinates are in inventory slot area
if (x_coord >= 490 
&& x_coord <= 490 + 10*86 
&& y_coord >= 121 
&& y_coord <= 121 + 10*86) {
		// Floor division by 66, then adjust for offsets
		// Return the slot number
}

// Return -1 if coords do not correspond with a slot