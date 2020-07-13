if (!is_active) exit;

var text_pos = HEIGHT - TEXT_HEIGHT;

draw_self();

draw_set_alpha(0.8);
draw_set_color(c_black);
draw_rectangle(x, y, x + WIDTH, y + HEIGHT, false);
draw_set_alpha(1);

// Turn newlines into new entries into lines array
for (var i = 0; i < ds_list_size(lines); i++) {
	var str = lines[| i];
	var str_list = split(str, "\n");
	ds_list_delete(lines, i)
	for (var j = 0; j < ds_list_size(str_list); j++) {
		ds_list_insert(lines, i, str_list[| j]);
		i++;
	}
	i--;
}

// Trim characters past MAX_LINE_LENGTH chars
for (var i = 0; i < ds_list_size(lines); i++) {
	var str = lines[| i];
	if (string_length(str) > MAX_LINE_LENGTH) {
		var left = string_copy(str, 1, MAX_LINE_LENGTH);
		var right = string_copy(str, MAX_LINE_LENGTH + 1, string_length(str) - MAX_LINE_LENGTH);
		lines[| i] = left;
		ds_list_insert(lines, i + 1, right);
	}
}

// Trim lines past MAX_LINES
while (ds_list_size(lines) > MAX_LINES) {
	ds_list_delete(lines, 0);
}

text = keyboard_string;
text += after_caret;

// Trim input line
text = string_copy(text, string_length(text) - caret - MAX_LINE_LENGTH + 2, MAX_LINE_LENGTH);

caret_text = "";
if (is_caret) {
	for (var i = 0; i < string_length(text) - caret; i++) {
		caret_text += " ";	
	}
	caret_text += "|";
}

// If some text is trimmed, then caret will be at the wrong spot, since it's pos is calcluated from the 
// end of the entire string, not just the end of the visible string. This fixes that through balck magic.
caret_text = string_copy(caret_text, string_length(caret_text) - caret - MAX_LINE_LENGTH + 1, MAX_LINE_LENGTH);

draw_set_halign(fa_left);
draw_set_valign(fa_top);
draw_set_font(fnt_monospace);
draw_set_color(c_green)
draw_text(x + LEFT_TEXT_PADDING, y + text_pos, text);
draw_text(x + LEFT_TEXT_PADDING / 2 + 1, y + text_pos, caret_text);
for (var i = ds_list_size(lines) - 1; i >= 0; i--) {
	text_pos -= TEXT_HEIGHT;
	draw_text(x + LEFT_TEXT_PADDING, y + text_pos, lines[| i]);
}
