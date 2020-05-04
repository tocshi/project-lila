// parses a json file (filename as string) into a string

var filename = argument0;
var dataFile = file_text_open_read(filename);

var dataStr = "";
while(!file_text_eof(dataFile)){
	dataStr += file_text_read_string(dataFile);
	file_text_readln(dataFile);
}
file_text_close(dataFile);

return json_decode(dataStr);