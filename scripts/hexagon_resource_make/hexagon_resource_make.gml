///@description Applies a set of properties to a set of hexagons, creating a resource
///@param _hex
///@param _points
{
var _hex    = argument0;
var _points = argument1;
	
if(ds_exists(_hex, ds_type_map)) {
	// Rules
	hexagon_rule_add(_hex, rule.connect, []);
		
	// Rewards
	hexagon_reward_add(_hex, reward.points, _points);
}
}