///@description Returns a list of the adjacent hexagons to the one given
///@param board_x
///@param board_y
{
var _xx = argument0;
var _yy = argument1;

var _adjs  = array_create(6, -1);
var _list  = ds_list_create();
var _count = 0;

if(_xx < grid_width and _yy < grid_height) {
	if(_yy mod 2 == 0) {
		_adjs[0] = board[# _xx - 1, _yy - 1];
		_adjs[1] = board[#     _xx, _yy - 1];
		_adjs[2] = board[# _xx - 1,     _yy];
		_adjs[3] = board[# _xx + 1,     _yy];
		_adjs[4] = board[# _xx - 1, _yy + 1];
		_adjs[5] = board[#     _xx, _yy + 1];
	}
	else {
		_adjs[0] = board[#     _xx, _yy - 1];
		_adjs[1] = board[# _xx + 1, _yy - 1];
		_adjs[2] = board[# _xx - 1,     _yy];
		_adjs[3] = board[# _xx + 1,     _yy];
		_adjs[4] = board[#     _xx, _yy + 1];
		_adjs[5] = board[# _xx + 1, _yy + 1];
	}
	
	for(var i = 0; i < 6; i++) {
		var _adj = _adjs[i];
		
		if(not is_undefined(_adj) and ds_exists(_adj, ds_type_map)) {
			ds_list_add(_list, _adj);
			_count++;
		}
	}
}

if(_count == 0) {
	ds_list_destroy(_list);
	return -1;
}

return _list;
}