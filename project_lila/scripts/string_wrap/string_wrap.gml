///@arg string,max_width

var str = argument0;
var max_width = argument1;

var cutoff = 1;
var count = 1;
var substr;

repeat(string_length(str)){
	substr = string_copy(str,1,count);
	if(string_char_at(str,count) == " " || string_char_at(str,count) == "-"){
		cutoff = count;
	}
	
	if(string_width(substr) > max_width){
		str = string_delete(str,cutoff,1);
		str = string_insert("\n",str,cutoff);
	}
	count++;
}

return str;