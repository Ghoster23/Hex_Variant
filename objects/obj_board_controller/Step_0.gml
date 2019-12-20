if(mouse_check_button_pressed(mb_left)) {
	for(var i = 0; i < grid_height; i++) {
		for(var j = 0; j < grid_width; j++) {
			var _hex = board[# j, i];
		
			if(_hex != -1 and hexagon_collide(_hex)) {
				if(hexagon_occupy(_hex, current_player)) {
					click = false;
				}
			}
		}
	}
}

if(not click and alarm[0] == -1) {
	turn += 1;
								
	current_player = (current_player + 1) mod player_count;
								
	alarm[0] = 5;
}