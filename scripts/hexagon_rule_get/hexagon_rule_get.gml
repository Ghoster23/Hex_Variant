///@description Checks if a given hexagon has a certain rule
///@return Rule info array or -1 if the rule is not in effect
///@param id
///@param rule_id
{
var _hex  = argument0;
var _rule = argument1;

if(ds_exists(_hex, ds_type_map)) {
	var _rules = _hex[? "Rules"];
	
	if(not is_undefined(_rules) and _rules != -1 and ds_exists(_rules, ds_type_map)) {
		if(ds_map_exists(_rules, _rule)) {
			return _rules[? _rule];
		}
	}
}

return 0;
}