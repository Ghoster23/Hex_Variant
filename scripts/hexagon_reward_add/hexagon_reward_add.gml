///@description Tries to add a reward to a given hexagon
///@return reward info array or -1 if the reward is not in effect
///@param id
///@param reward_id
///@param reward_info
{
var _hex    = argument0;
var _reward = argument1;
var _info   = argument2;

if(ds_exists(_hex, ds_type_map)) {
	var _rewards = _hex[? "Rewards"];
	
	if(_rewards != -1 and ds_exists(_rewards, ds_type_map)) {
		if(ds_map_exists(_rewards, _reward)) {
			return -1;
		}else {
			ds_map_add(_rewards, _reward, _info);
		}
	}else {
		_rewards = ds_map_create();
		ds_map_add(_rewards, _reward, _info);
		_hex[? "Rewards"] = _rewards;
	}
}

return 0;
}