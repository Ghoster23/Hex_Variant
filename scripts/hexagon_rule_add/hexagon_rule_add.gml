///@description Tries to add a rule to a given hexagon
///@return Rule info array or -1 if the rule is not in effect
///@param id
///@param rule_id
///@param rule_info
{
var _hex  = argument0;
var _rule = argument1;
var _info = argument2;

if(ds_exists(_hex, ds_type_map)) {
	var _rules = _hex[? "Rules"];
	
	if(_rules != -1 and ds_exists(_rules, ds_type_map)) {
		if(ds_map_exists(_rules, _rule)) {
			return -1;
		}else {
			ds_map_add(_rules, _rule, _info);
		}
	}else {
		_rules = ds_map_create();
		ds_map_add(_rules, _rule, _info);
		_hex[? "Rules"] = _rules;
	}
}

return 0;
}