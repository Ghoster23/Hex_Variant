///@description Checks if a given hexagon has a certain reward
///@return Reward info array or -1 if the reward is not applied
///@param id
///@param reward_id
{
var _hex    = argument0;
var _reward = argument1;

if(ds_exists(_hex, ds_type_map)) {
	var _rewards = _hex[? "Rewards"];
	
	if(not is_undefined(_rewards) and _rewards != -1 and ds_exists(_rewards, ds_type_map)) {
		if(ds_map_exists(_rewards, _reward)) {
			return _rewards[? _reward];
		}
	}
}

return 0;
}