///@description Checks if a hexagon ds_object (ds_map) can connect to either
///@description of the players sides.
///@param id
///@param player
{
var _hex    = argument0;
var _player = argument1;

var _side = slot_side.neutral;

// If Hex exists
if(ds_exists(_hex, ds_type_map)) {
	var _con = _hex[? "Connect"];
	
	var _con_bool = _con[0] or _con[1]; // Has the hex already been connected by a player?
	
	// If not connected
	if(not _con_bool) {
		#region If the tile type matches the player
		if(_hex[? "Type"] == _player or _hex[? "Type"] == slot_type.blue_red) {
			_side = _hex[? "Side"]; // Non-neutral tiles are only on the sides
			
			#region Check which side
			switch(_side) {
				case slot_side.left:
				case slot_side.right:
					_con[_side] = true;
				break;
					
				case slot_side.both:
					// No hexagon is on both sides -> Can't happen
					_con = [true, true];
					show_debug_message("No hex should be on both sides.");
				break;
			}
			#endregion
		}
		#endregion
		
		#region Check for connections on adjacent tiles
		var _adjs = hexagon_get_adjacent(_hex); // Get adjacents
			
		// If there are adjacent tiles (there should always be)
		if(_adjs != -1 and ds_exists(_adjs, ds_type_list)) {
			var _count = ds_list_size(_adjs); // Get count
				
			#region For each adjacent tile
			for(var i = 0; i < _count; i++) {
				var _adj = _adjs[| i]; // Get hex
					
				#region If the adjacent tile has been played on by the player
				if(_adj[? "Player"] == _player) {
					var _adj_con = _adj[? "Connect"];  // Get tile's connection info
						
					if(_adj_con[0] != _con[0]) {
						if(_adj_con[0]) {
							_con[0] = true;
						}
						else {
							_adj_con[0] = true;
						}
					}
					
					if(_adj_con[1] != _con[1]) {
						if(_adj_con[1]) {
							_con[1] = true;
						}
						else {
							_adj_con[1] = true;
						}
					}
					
					_adj[? "Connect"] = _adj_con;
				}
				#endregion
			}
			#endregion
		}
		#endregion
	}
	
	_hex[? "Connect"] = _con;
}
}