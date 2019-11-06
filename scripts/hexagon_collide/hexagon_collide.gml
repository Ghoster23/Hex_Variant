///@description Checks the approx. collision for an hexagon at the given point
///@param id
{
var _hex = argument0;

if(ds_exists(_hex, ds_type_map)) {
	if(point_in_circle(mouse_x, mouse_y, _hex[? "X"] - 0.5, _hex[? "Y"] - 0.5, 28)) {
		return 1;
	}
}

return 0;
}