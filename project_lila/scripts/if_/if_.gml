var condition = fp_get_val(argument0);
var run_if_true = argument1;
var run_if_false = argument2;
if (fp_get_val(condition)) {
	execute_calls(run_if_true);
} else {
	execute_calls(run_if_false);
}