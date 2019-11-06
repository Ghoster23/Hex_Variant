#region Zoom Calculation
var diff = abs(zoom - target_zoom);

//If current zoom and target zoom differ more than tolerance
if(diff > zoom_tolr){
	//Make current zoom approach target
	zoom = scr_approach(zoom, target_zoom, diff * zoom_rate);
}else {
	//Set zoom to target
	zoom = target_zoom;
}

//Calculate zoomed camera dimensions
width  = orig_wd / zoom;
height = orig_hg / zoom;
#endregion

screen_shake *= 0.5; //Screen Shake Decay

camera_set_view_pos(   view_camera[0], x - width / 2,  y - height / 2);
camera_set_view_size(  view_camera[0],         width,          height);