///@description Enforces a given hexagon rule
///@return True or false
///@param id
///@param rule_id
///@param player
{
var _hex    = argument0;
var _rule   = argument1;
var _player = argument2;

if(ds_exists(_hex, ds_type_map)) {
	var _rules = _hex[? "Rules"];
	
	if(_rules != -1 and ds_exists(_rules, ds_type_map)) {
		if(ds_map_exists(_rules, _rule)) {
			switch(_rule) {
				case rule.connect:
				#region
					// Get list of adjacent tiles
					var _adjs = hexagon_get_adjacent(_hex);
					
					// If adjacent tiles were found
					var _ind = 0;
					var _adj = _adjs[| _ind];
					
					while(not is_undefined(_adj)) {
						if(_adj[? "Player"] == _player) {
							var _con = _adj[? "Connect"];
							if(_con[0] or _con[1]) {
								return true;
							}
						}
						
						_ind++;
						_adj = _adjs[| _ind];
					}
				#endregion
				break;
					
				case rule.territory:
				#region
				var _conq = _hex[? "Conquer"];
				
				// If conquered by this player
				if(_conq == _player) {					
					return true;
				}
				// If not conquered
				else if(_conq == -1) {
					var _adjs = hexagon_get_adjacent(_hex);
					
					var _ind = 0;
					var _adj = _adjs[| _ind];
					
					while(not is_undefined(_adj)) {
						if(_adj[? "Player"] == _player) {
							var _con = _adj[? "Connect"];
							if(_con[0] or _con[1]) {
								return true;
							}
						}
						
						_ind++;
						_adj = _adjs[| _ind];
					}				
				// If conquered by the other player
				}else {
					return false;
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