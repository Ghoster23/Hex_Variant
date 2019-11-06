///@description Gives a specified reward for getting and hexagon
///@return True or false
///@param id
///@param reward_id
///@param player
{
var _hex    = argument0;
var _reward = argument1;
var _player = argument2;

var _plr = players[_player];

if(ds_exists(_hex, ds_type_map)) {
	var _rewards = _hex[? "Rewards"];
	
	// Check that the rewards data structure exists
	if(_rewards != -1 and ds_exists(_rewards, ds_type_map)) {
		// Check that the reward exists
		if(ds_map_exists(_rewards, _reward)) {
			var _info = _rewards[? _reward]; // Get the reward's info
			
			switch(_reward) {
				case reward.points:
				#region
					_plr[? "Points"] += _info;
				#endregion
				break;
					
				case reward.multiplier:
				#region
					_plr[? "Multiplier"] += _info;
				#endregion
				break;
				
				case reward.territory:
				#region
					if(_hex[? "Conquer"] == -1) {
						_plr[? "Points"]     += _info[0];
						_plr[? "Multiplier"] += _info[1];
					}
				#endregion
				break;
					
				default:
				break;
			}
		}
	}
}

return false;
}