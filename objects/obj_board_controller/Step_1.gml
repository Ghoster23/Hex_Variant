switch(board_state) {
	case 0:
		type = 1;
			
		if(type != -1) {
			#region Init
			var _w = tile_size;
			var _h = tile_size * 3/4 + 1;
				
			switch(type) {
				case 0: 
					#region Classic
					board = ds_grid_create(size, size);
					player_count = 2;
					grid_width  = size;
					grid_height = size;
						
					var _x = room_width  / 2;
					var _y = room_height / 2 - _h * (size - 1);
		
					for(var i = 0; i < size; i++) {			
						for(var j = 0; j < size; j++) {
							var _tp  = slot_type.neutral;
								
							var _hex_x = _x + j * _w * 1/2;
							var _hex_y = _y + j * _h;
				
							if(i == 0 or i == size - 1) {
								_tp = slot_type.red;
							}
				
							if(j == 0 or j == size - 1) {
								if(_tp == slot_type.neutral) {
									_tp = slot_type.blue;
								}else {
									_tp = slot_type.blue_red;
								}
							}
				
							board[# j, i] = hexagon_create(_sl_type, 0, _hex_x, _hex_y, j, i, -1, -1);
						}
							
						_x -= _w * 1/2;
						_y += _h;
					}
					#endregion
				break;
	
				case 1: 
					#region Elongated Hexagonal
					grid_width  = size * 2 - 1;
					grid_height = round(grid_width / 1.24);
						
					board = ds_grid_create(grid_width, grid_height);
					ds_grid_set_region(board, 0, 0, grid_width - 1, grid_height - 1, -1);
						
					var _x = room_width  / 2 - (grid_width div 2) * _w;
					var _y = room_height / 2;
						
					var _half_height = grid_height div 2;
						
					var _line_size    = grid_width;
					var _line_start   = 0;
					var _line_start_r = _line_start;
						
					#region Board
					for(var i = 0; i <= _half_height; i++) {
						_line_start_r = floor(_line_start);
							
						var _hex_ys  = [_y + i * _h, _y - i * _h];
						var _grid_ys = [_half_height + i, _half_height - i];
							
						for(var j = 0; j < _line_size; j++) {
							var _hex_x  = _x + j * _w;
							var _grid_x = _line_start_r + j;
							
							#region Side
							var _sl_side = slot_side.neutral;
								
							if(j == 0) {
								_sl_side = slot_side.left;
							}
							else if(j == _line_size - 1) {
								_sl_side = slot_side.right;
							}
							#endregion
								
							if(i == 0) {
								#region Middle
								var _hex_y  = _hex_ys[0];
								var _grid_y = _grid_ys[0];
									
								var _sl_type = (j == _line_start_r or j == _line_size - 1 ? slot_type.blue_red : slot_type.neutral);
									
								board[# _grid_x, _grid_y] = hexagon_create(_sl_type, _sl_side, _hex_x, _hex_y, _grid_x, _grid_y, -1, -1);
								#endregion
							}
							else {
								#region Up and Down
								#region Type
								var _typed = -1;
								
								if(j == 0) {
									_typed = 0;
								}
								else if(j == _line_size - 1){
									_typed = 1;
								}
								#endregion
									
								var _hex_y   = _hex_ys[0];
								var _grid_y  = _grid_ys[0];
								var _sl_type = (_typed != -1 ? slot_types[_typed] : slot_type.neutral);
									
								board[# _grid_x, _grid_y] = hexagon_create(_sl_type, _sl_side, _hex_x, _hex_y, _grid_x, _grid_y, -1, -1);
									
								_hex_y   = _hex_ys[1];
								_grid_y  = _grid_ys[1];
								_sl_type = _sl_type != slot_type.neutral ? (_sl_type == slot_type.blue ? slot_type.red : slot_type.blue) : _sl_type;
									
								board[# _grid_x, _grid_y] = hexagon_create(_sl_type, _sl_side, _hex_x, _hex_y, _grid_x, _grid_y, -1, -1);
								#endregion
							}
						}
							
						_line_size  -= 1;
						_line_start += 0.5;
							
						_x += _w * 0.5;
					}
					#endregion
						
					#region Special Tiles
					if(size == 11) {
						var town1 = [board[#  9,  1], board[# 10,  1], board[# 10,  2]];
						var town2 = [board[# 10, 14], board[#  9, 15], board[# 10, 15]];
						
						hexagon_town_make(town1, 1, 1);
						hexagon_town_make(town2, 1, 1);
							
						var _resrs = [board[# 4, 8], board[# 10, 8], board[# 16, 8], board[# 7, 4], board[# 13, 4], board[# 7, 12], board[# 13, 12]];
				
						for(var i = 0; i < array_length_1d(_resrs); i++) {
							hexagon_resource_make(_resrs[i], 2, i);
						}
					}
					#endregion
					#endregion
				break;
			}
				
			current_player = start_player;
				
			for(var i = 0; i < player_count; i++) {
				players[i] = player_create(i + 1, 1, 0);
			}
				
			board_state = 1;
			#endregion
		}
	break;
	
	case 1:
	break;
}