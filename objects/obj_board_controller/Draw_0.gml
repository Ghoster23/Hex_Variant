//draw_self();

for(var i = 0; i < grid_height; i++) {
	for(var j = 0; j < grid_width; j++) {
		var _hex = board[# j, i];
		
		hexagon_draw(_hex);
	}
}