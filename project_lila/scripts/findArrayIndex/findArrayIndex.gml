var array = argument0;
var toFind = argument1;

for (var i=0; i < array_length_1d(array); i++) {
	if (array[i] == toFind) {
		return i;
	}
}
return -1;