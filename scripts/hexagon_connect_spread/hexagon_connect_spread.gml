///@description Spreads the hexagon's connection to others
///@param hex_list
///@param player
///@param side
{
var _to_visit = argument0;
var _player   = argument1;
var _side     = argument2;

if(_to_visit == -1 or not ds_exists(_to_visit, ds_type_list)) {
	return _both;
}

var _visited  = ds_list_create();

var _hex = _to_visit[| 0];

// For each connected hex
while(not is_undefined(_hex)) {
	// If the tile has that player's piece
	if(_hex[? "Player"] == _player) {
		var _con = _hex[? "Connect"];
		
		switch(_side) {
			case slot_side.left:
			case slot_side.right:
				_con[_side] = true;
			break;
			
			case slot_side.both:
				_con = [true, true];
			break;
		}
		
		_hex[? "Connect"] = _con;
		
		if(_side < slot_side.both and (_con[0] and _con[1])) _side = slot_side.both;
		
		var _adj = board_get_adjacent(_hex[? "Grid_X"], _hex[? "Grid_Y"]); // Get adjacents
			
		// If there are adjacents
		if(_adj != -1) {
			var _cnt = ds_list_size(_adj); // Get count
				
			// For each adjacent
			for(var j = 0; j < _cnt; j++) {
				var _adj_hex = _adj[| j];
				
				// If the Hex is the players
				if(_adj_hex[? "Player"] == _player) {
					// If it has not been visited or isn't yet gonna be
					if(ds_list_find_index(_visited, _adj_hex) == -1 and
						ds_list_find_index(_to_visit, _adj_hex) == -1) {
					
						ds_list_add(_to_visit, _adj_hex); // Add to the to visit list
					}
				}
			}
		}
	}
	
	ds_list_add(_visited, _hex);
	ds_list_delete(_to_visit, 0);
	_hex = _to_visit[| 0];
}

return _side;
}