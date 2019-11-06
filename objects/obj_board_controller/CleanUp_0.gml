if(ds_exists(board, ds_type_grid)) {
	for(var i = 0; i < grid_height; i++) {
		for(var j = 0; j < grid_width; j++) {
			var _hex = board[# i, j];
			
			if(_hex != -1) {
				hexagon_destroy(_hex);
			}
		}
	}
}