window_set_fullscreen(true);

#region Turn
turn           = 0;
player_count   = 2;
start_player   = 0;
current_player = 0;

players = [];
#endregion

#region Board
type =  -1; // [0 - classic, 1 - hexagonal]
size =  11; // number of hexagons that form the side of the board

board     = -1; // ds_grid

grid_width  = 0; // grid width
grid_height = 0; // grid height

tile_size = 64;

board_state = 0;

slot_types = [slot_type.red, slot_type.blue];
#endregion

#region System
click = true;
#endregion