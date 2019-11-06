///@description Creates an hexagon ds_object (ds_map)
///@param ds_map_id
{
var _hex = argument0;

if(not is_undefined(_hex) and ds_exists(_hex, ds_type_map)) {
	
	var _rules = _hex[? "Rules"];
	
	if(_rules != -1 and ds_exists(_rules, ds_type_map)) {
		ds_map_destroy(_rules);
	}
	
	var _rewards = _hex[? "Rewards"];
	
	if(_rewards != -1 and ds_exists(_rewards, ds_type_map)) {
		ds_map_destroy(_rewards);
	}
	
	ds_map_destroy(_hex);
	return 1;
}

return 0;
}