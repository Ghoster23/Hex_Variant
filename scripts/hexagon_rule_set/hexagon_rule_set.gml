///@description Tries to ser a given hexagon's rule to a certain value
///@return Rule info array or -1 if the rule is not in effect
///@param id
///@param rule_id
{
var _hex  = argument0;
var _rule = argument1;
var _info = argument2;

if(ds_exists(_hex, ds_type_map)) {
	var _rules = _hex[? "Rules"];
	
	if(_rules != -1 and ds_exists(_rules, ds_type_list)) {
		if(ds_map_exists(_rules, _rule)) {
			_rules[? _rule] = _info;
		}
	}
}

return 0;
}