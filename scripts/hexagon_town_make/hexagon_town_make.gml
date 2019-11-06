///@description Applies a set of properties to a set of hexagons, creating a town
///@param _hex_array
///@param _points
///@param _multiplier
{
var _hexs       = argument0;
var _points     = argument1;
var _multiplier = argument2;

var _len = array_length_1d(_hexs);

var _rule_info   = _hexs;                   // Tiles that make up the territory
var _reward_info = [ _points, _multiplier]; // Prize for getting it

for(var i = 0; i < _len; i++) {
	var _hex = _hexs[i];
	
	if(ds_exists(_hex, ds_type_map)) {
		// Rules
		hexagon_rule_add(_hex, rule.territory, _rule_info);
		
		// Rewards
		hexagon_reward_add(_hex, reward.territory, _reward_info);
	}
}
}