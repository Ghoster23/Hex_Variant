///@description Applies a set of properties to a set of hexagons, creating a resource
///@param _hex
///@param _points
///@param _looks_opt
{
if(argument_count < 2 or argument_count > 3) {
	show_debug_message("Error - hexagon_resource_make takes 2 or 3 arguments.");
	return;
}
	
var _hex    = argument[0];
var _points = argument[1];

var _looks = irandom(7);

if(argument_count == 3) {
	_looks = argument[2];
}
	
if(ds_exists(_hex, ds_type_map)) {
	// Rules
	hexagon_rule_add(_hex, rule.connect, []);
		
	// Rewards
	hexagon_reward_add(_hex, reward.points, _points);
	
	// Looks
	_hex[? "Looks"] = _looks;
}
}