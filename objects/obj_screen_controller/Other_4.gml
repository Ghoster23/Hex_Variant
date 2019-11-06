var cam = room_get_camera(room, 0); //Initial room camera

with(obj_camera) {
	x = room_width  / 2;
	y = room_height / 2;

	target_x = x;
	target_y = y;
}

camera_set_view_pos(view_camera[0], x - (view_wport[0] / 2), y - (view_hport[0] / 2));

//Camera
global.cam_wd  = camera_get_view_width(cam);  //Default camera width
global.cam_hg  = camera_get_view_height(cam); //Default camera heigth

global.cam_asr = global.cam_wd/global.cam_hg; //Default camera aspect ratio

if(fullscreen){
	scr_adjust_app_gui_surfaces(pixelperfect,  Monitor_wd,   Monitor_hg, global.cam_wd, global.cam_hg, true);
}else {
	window_set_size(min(global.cam_wd, Monitor_wd), min(global.cam_hg, Monitor_hg));
	scr_adjust_app_gui_surfaces(pixelperfect, window_get_width(), window_get_height(), global.cam_wd, global.cam_hg, true);
}