///@description Enforces all of a given hexagon's rules
///@return True or false
///@param id
///@param player
{
var _hex    = argument0;
var _player = argument1;

if(ds_exists(_hex, ds_type_map)) {
	var _rules = _hex[? "Rules"];
	
	var _rule = ds_map_find_first(_rules);
	
	while(not is_undefined(_rule)) {
		if(not hexagon_rule_enforce(_hex, _rule, _player)) {
			return false;
		}
		
		_rule = ds_map_find_next(_rules, _rule);
	}
}

return true;
}