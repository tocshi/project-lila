var array = argument0;
var toFind = argument1;

var count = 0;
for (var i=0; i < array_length_1d(array); i++) {
	if (array[i] == toFind) {
		count++;
	}
}
if(count == 0){return -1;}
var result = array_create(count);
for (var i=0; i < array_length_1d(array); i++) {
	if (array[i] == toFind) {
		result[array_length_1d(result)-count] = i;
		count--;
	}
}
return result;