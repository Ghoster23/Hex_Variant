///@description Tries to set a given hexagon's reward to a certain value
///@return reward info array or -1 if the reward is not in effect
///@param id
///@param reward_id
{
var _hex    = argument0;
var _reward = argument1;
var _info   = argument2;

if(ds_exists(_hex, ds_type_map)) {
	var _rewards = _hex[? "Rewards"];
	
	if(_rewards != -1 and ds_exists(_rewards, ds_type_list)) {
		if(ds_map_exists(_rewards, _reward)) {
			_rewards[? _reward] = _info;
		}
	}
}

return 0;
}