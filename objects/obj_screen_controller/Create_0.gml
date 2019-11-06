application_surface_draw_enable(false);
if(scr_unique_inst()) {exit;}

window_set_fullscreen(true);

over = false;

alarm[0] = 5;

monitor_dimension_options = ["1080x720", "1280x800", "1280x1024", "1366x768", "1440x900", "1600x900", "1920x1080", "Auto-detect"];
monitor_width  = [1080, 1280, 1280, 1366, 1440, 1600, 1920, display_get_width()];
monitor_heigth = [ 720,  800, 1024,  768,  900,  900, 1080, display_get_height()];

dimensions = 7;

fullscreen   = window_get_fullscreen();
pixelperfect = true;

global.gui_ratio = 1;

#region Init
//Monitor
Monitor_wd = monitor_width[dimensions];  //Monitor width
Monitor_hg = monitor_heigth[dimensions]; //Monitor height

// Adjusts room views' dimenions to be a (sub)multiple of the monitor's dimensions
var _cam = room_get_camera(room0, 0);

camera_set_view_size(  _cam, Monitor_wd, Monitor_hg); //Change view size
camera_set_view_border(_cam, Monitor_wd / 2, Monitor_hg / 2); //Change view border
	
room_set_viewport(room0, 0, true, 0, 0, Monitor_wd, Monitor_hg); //Set viewport
#endregion

#region Adjustments
if(fullscreen){
	scr_adjust_app_gui_surfaces(pixelperfect, Monitor_wd, Monitor_hg, view_wport[0], view_hport[0], true);
}else {
	window_set_size(view_wport[0], view_hport[0]);
	scr_adjust_app_gui_surfaces(pixelperfect, window_get_width(), window_get_height(), view_wport[0], view_hport[0], true);
}
#endregion

room_goto_next();