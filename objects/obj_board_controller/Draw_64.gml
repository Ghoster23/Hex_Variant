if(board_state == 1) {
	draw_set_valign(fa_top);
	draw_set_halign(fa_left);

	draw_text(8,  8, "Current Player: " + string(current_player) + "\n");

	var _plr = players[0];
	draw_text(8, 24, "Player Blue: " + string(_plr[? "Points"]) + " x " + string(_plr[? "Multiplier"]) + " = " + string(_plr[? "Points"] * _plr[? "Multiplier"]) + "\n");

	_plr = players[1];
	draw_text(8, 40, "Player Red: " + string(_plr[? "Points"]) + " x " + string(_plr[? "Multiplier"]) + " = " + string(_plr[? "Points"] * _plr[? "Multiplier"]) + "\n");
	
	draw_text(8, 56, "Reset board by pressing 'R'");
	draw_text(8, 72, "Close the game by pressing 'Esc'");
}