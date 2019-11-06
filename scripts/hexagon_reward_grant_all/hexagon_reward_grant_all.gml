///@description Grants all of a given hexagon's rewards
///@return True or false
///@param id
///@param player
{
var _hex    = argument0;
var _player = argument1;

var _granted = false;

if(ds_exists(_hex, ds_type_map)) {
	var _rewards = _hex[? "Rewards"];
	
	var _reward = ds_map_find_first(_rewards);
	
	while(not is_undefined(_reward)) {
		_granted = _granted or hexagon_reward_grant(_hex, _reward, _player);
		
		_reward = ds_map_find_next(_rewards, _reward);
	}
}

return _granted;
}