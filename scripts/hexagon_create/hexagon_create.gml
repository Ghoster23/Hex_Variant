///@description Creates an hexagon ds_object (ds_map)
///@param type
///@param side
///@param x
///@param y
///@param grid_x
///@param grid_y
///@param rules
///@param reward
{
if(argument_count < 6) {
	return -1;
}

var _type = argument[0];
var _side = argument[1];  

var _x      = argument[2];
var _y      = argument[3];

var _gr_x   = argument[4];
var _gr_y   = argument[5];

var _rules  = -1;
if(argument_count >= 7) {
	_rules  = argument[6];
}

var _rewards = -1;
if(argument_count >= 8) {
	_rewards = argument[7];
}

var _map = ds_map_create();

// Type of hexagon   [-1 - neutral | 0 - Blue | 1 - Red   | 2 - Both]
ds_map_add(_map, "Type", _type);
// Side of the board [-1 - neither | 0 - Left | 1 - Right | 2 - Both]
ds_map_add(_map, "Side", _side);

ds_map_add(_map,  "Player", -1);      // Player that has a piece on the tile
ds_map_add(_map, "Connect", [0,0]);   // Is the tile connected or not
ds_map_add(_map, "Conquer", -1);      // Only this player can play on this tile

ds_map_add(_map,   "Rules", _rules);	// DS-List of the tile's rules
ds_map_add(_map, "Rewards", _rewards);	// Reward for taking the tile

ds_map_add(_map, "X", _x);	// Hexagon's X
ds_map_add(_map, "Y", _y);	// Hexagon's Y

ds_map_add(_map, "Grid_X", _gr_x);	// Hexagon's X
ds_map_add(_map, "Grid_Y", _gr_y);	// Hexagon's Y

ds_map_add(_map, "Looks", irandom(3));

return _map;
}