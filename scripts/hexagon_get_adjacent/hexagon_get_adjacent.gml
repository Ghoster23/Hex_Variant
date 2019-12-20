///@description Returns adjacent tiles to a given hexagon
///@param id
{
var _hex = argument0;

if(ds_exists(_hex, ds_type_map)) {
	var _adjs = _hex[? "Adjacencies"];
	
	if(_adjs == -1 or is_undefined(_adjs) or not ds_exists(_adjs, ds_type_list)) {
		_adjs = board_get_adjacent(_hex[? "Grid_X"], _hex[? "Grid_Y"]);
		
		_hex[? "Adjacencies"] = _adjs;
	}
}

return _adjs;
}