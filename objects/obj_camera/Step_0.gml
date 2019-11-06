#region Movement State Execution
switch move_state {
	case 0: //Stopped

	break;
	
	case 1: //Move
		x += (target_x - x) * movement_rate;
		y += (target_y - y) * movement_rate;
	break;
}
#endregion

//Screen Shake calculation
if(screen_shake){
	shake_x = x + random_range(-screen_shake,screen_shake) * 4;
	shake_y = y + random_range(-screen_shake,screen_shake) * 4;
	
	x = scr_approach(x, shake_x, 16);
	y = scr_approach(y, shake_y, 16);
}