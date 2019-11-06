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
					var _adjs = board_get_adjacent(_hex[? "X"], _hex[? "Y"]);
					
					// If adjacent tiles were found
					if(_adjs != -1) {
						var _len = ds_list_size(_adjs);
						
						for(var i = 0; i < _len; i++) {
							var _adj = _adjs[| i];
							
							if(_adj[? "Player"] == _player) {
								return true;
							}
						}
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
					var _adjs = board_get_adjacent(_hex[? "X"], _hex[? "Y"]);
					
					if(_adjs != -1) {
						var _len = ds_list_size(_adjs);
						
						for(var i = 0; i < _len; i++) {
							var _adj = _adjs[| i];
							
							if(_adj[? "Player"] == _player) {
								return true;
							}
						}
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