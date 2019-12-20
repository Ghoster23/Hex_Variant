///@description Occupies an hexagon ds_object (ds_map)
///@param id
///@param player
{
var _hex    = argument0;
var _player = argument1;

var _passed  = false;
var _granted = false;

// If Hex exists
if(ds_exists(_hex, ds_type_map)) {
	var _hex_player = _hex[? "Player"]; // Pawn on it
	
	// Has a pawn be placed on it?
	if(_hex_player == -1) {		
		#region Check rules
		var _rules = _hex[? "Rules"];
		
		if(_rules != rule.none) {
			_passed = hexagon_rule_enforce_all(_hex, _player);
		}else {
			_passed = true;
		}
		#endregion
		
		// If the rules have been followed
		if(_passed) {
			_hex[? "Player"] = _player; // Place the player's pawn on it
			
			#region Grant rewards
			var _rewards = _hex[? "Rewards"];
			
			if(_rewards != reward.none) {
				_granted = hexagon_reward_grant_all(_hex, _player);
			}
			#endregion
			
			#region Conquer
			_hex[? "Conquer"] = _player; // Only this player can play on this tile (redudant for most)
			
			// If there are rules
			if(_rules != rule.none) {
				// If the territory rule is applied
				if(ds_map_exists(_rules, rule.territory)) {
					var _parts = _rules[? rule.territory]; // Get the territory's tiles
					var _len   = array_length_1d(_parts);  // Get count
					
					for(var i = 0; i < _len; i++) {
						var _part = _parts[i];
						
						_part[? "Conquer"] = _player; // Conquer each territory tile
					}
				}
			}
			#endregion
			
			#region Search for a connection
			hexagon_connect(_hex, _player);
			
			var _con = _hex[? "Connect"];
			
			// If connected
			if(_con[0] or _con[1]) {
				// Connect owned adjacents
				var _side = (_con[0] ? (_con[1] ? slot_side.both : slot_side.left) : slot_side.right);
				
				var _adjs = ds_list_create();
				ds_list_copy(_adjs, hexagon_get_adjacent(_hex))
				
				if(hexagon_connect_spread(_adjs, _player, _side) == slot_side.both) {
					var _plr = players[_player];
					
					if(not _plr[? "Link"]) {
						_plr[? "Link"] = true;
						_plr[? "Multiplier"] += 2;
					}
				}
			}
			#endregion
			
			return true;
		}
	}
}

return false;
}