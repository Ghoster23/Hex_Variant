#region Movement Modes
switch move_mode {
	case 0:
		#region Follow
		if(follow != noone){
			if(follow == "mouse") {
				var diff_x = mouse_x - x;
				var diff_y = mouse_y - y;
				
				if(abs(diff_x) > 0.2 * view_wport[0]) target_x = x + diff_x * 0.1;
				if(abs(diff_y) > 0.2 * view_hport[0]) target_y = y + diff_y * 0.1;
				
				target_x = clamp(target_x, 0, room_width);
				target_y = clamp(target_y, 0, room_height);
			}
			else {
				target_x = follow.x + 32;
				target_y = follow.y + 32;
			}
		}else {
			target_x = room_width  div 2;
			target_y = room_height div 2;
		}
		#endregion
	break;
	
	case 1:
		#region Mouse Drag
		switch(drag_state) {
			case 0:
				if(mouse_check_button_pressed(mb_right)) {
					drag_state = 1;
					
					drag_prev = [device_mouse_x_to_gui(0), device_mouse_y_to_gui(0)];
				}
			break;
			
			case 1:
				var _cur_x = device_mouse_x_to_gui(0);
				var _cur_y = device_mouse_y_to_gui(0);
				
				target_x = clamp(x + (drag_prev[0] - _cur_x) * 2, 0, room_width);
				target_y = clamp(y + (drag_prev[1] - _cur_y) * 2, 0, room_height);
				
				drag_prev[0] = _cur_x;
				drag_prev[1] = _cur_y;
			
				if(mouse_check_button_released(mb_right)) {
					drag_state = 0;
				}
			break;
		}
		#endregion
	break;
}
#endregion

#region Zoom Control
if(can_zoom) {
	var diff = abs(target_zoom - 1);
		
	if(1 <= target_zoom) {
		if(target_zoom < max_zoom and mouse_wheel_up()) {
			target_zoom += 0.2;
		}else
		if(mouse_wheel_down()) {
			target_zoom -= 0.4 * max(diff / 3, 0.33);
		}
	}else {
		if(mouse_wheel_up()) {
			target_zoom += 0.4 * max(diff / 0.75, 0.33);
		}else
		if(min_zoom < target_zoom and mouse_wheel_down()) {
			target_zoom -= 0.05;
		}
	}
		
	if(abs(target_zoom - 1) <= 0.1) {
		target_zoom = 1;
	}
		
	if(target_zoom > max_zoom) { target_zoom = max_zoom; }
	if(target_zoom < min_zoom) { target_zoom = min_zoom; }
}
#endregion

#region Movement State Machine
switch move_state {
	case 0: //Stopped
		if(target_x != x || target_y != y){
			move_state = 1;
		}
	break;
	
	case 1: //Move
		if(abs(target_x - x) < 0.01 && abs(target_y - y) < 0.01){
			x = target_x;
			y = target_y;
			
			move_state = 0;
		}
	break;
}
#endregion