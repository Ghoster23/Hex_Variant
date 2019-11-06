///@description Creates a player ds_object (ds_map)
///@param id
///@param multiplier
///@param points
{
var _id   = argument0;
var _mult = argument1;
var _pts  = argument2;

var _map = ds_map_create();

ds_map_add(_map,         "ID",  _id);    // Player id
ds_map_add(_map, "Multiplier",  _mult);  // Player the tile belongs to
ds_map_add(_map,     "Points",  _pts);   // Is the tile connected or not
ds_map_add(_map,       "Link",  false);  // Has the player linked the two sides

return _map;
}