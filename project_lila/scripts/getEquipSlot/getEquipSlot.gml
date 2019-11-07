// Returns the item's equip slot if it's equippable.
var item = argument0;

if(ds_map_find_value(global.itemData[| item],"type") != "equippable"){return -1;}

var category = ds_map_find_value(global.itemData[| item],"category");

switch(category){
	case "Longsword":
	case "Bow":
	case "Shortsword":
	case "Spear":
	case "Axe":
	case "Gun":
	case "Knife":
	case "Fist":
	case "Spellbook":
	case "Staff":
	case "Crossbow":
	case "Chain Knife":
		return 0;
	
	case "Headgear":
		return 1;
	
	case "Shield":
		return 2;
	
	case "Necklace":
		return 3;
	
	case "Top":
		return 4;
	
	case "Ring":
		return 5;
	
	case "Hand":
		return 6;
	
	case "Legwear":
		return 7;
	
	case "Belt":
		return 8;
	
	case "Core":
		return 9;
	
	case "Shoes":
		return 10;
	
	case "Pet":
		return 11;
}