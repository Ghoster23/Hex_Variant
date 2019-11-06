if(scr_unique_inst()) {exit;}

image_xscale = 3;
image_yscale = 3;

width  = view_wport[0];
height = view_hport[0];

orig_wd = width;
orig_hg = height;

#region Movement
movement_rate = 0.25;

move_mode = 1; //[ 0 - follow | 1 - mouse drag ]

#region Follow
follow = "mouse";

if(follow != noone){
	if(follow == "mouse") {
		x = mouse_x;
		y = mouse_y;
	}
	else if(instance_exists(follow)) {
		x = follow.x + 32;
		y = follow.y + 32;
	}
}else {
	x = room_width  / 2;
	y = room_height / 2;
	follow = noone;
}
#endregion

#region Drag
drag_state = 0;
drag_prev  = [0, 0];
#endregion
#endregion

//Position
target_x = x;
target_y = y;

#region Zoom
can_zoom = true;

zoom = 1;

zoom_rate = 0.3;
zoom_tolr = 0.01;

target_zoom = 1;

min_zoom = 0.25;
max_zoom = 4;
#endregion

#region Shake
screen_shake = 0;

shake_x = x;
shake_y = y;
#endregion

//States
move_state = 0;