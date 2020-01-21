var s = argument0;

var n = string_length(string_digits(s));

var p = string_pos(".", s);

var e = string_pos("e", s);

switch (e) {

    case 0: break; // ok!

    case 1: return false; // "e#"

    case 2: if (p > 0) return false; break; // ".e#" or "1e."

    default: if (p > 0 && e < p) return false; break; // "1e3.3"

}

return n && n == string_length(s) - (string_char_at(s, 1) == "-") - (p != 0) - (e != 0);