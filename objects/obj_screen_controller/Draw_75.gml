/*draw_set_color(c_black);
draw_rectangle(0,0,180*cam_cvr,216*cam_cvr,false);
draw_set_color(c_white);
draw_text( 0,  0, "Monitor: "   + string(Monitor_wd)  + " " + string(Monitor_hg));
draw_text( 0, 24, "Window: "    + string(window_get_width()) + " " + string(window_get_height()));
draw_text( 0, 48, "Surface: "   + string(surface_get_width(application_surface)) + " " + string(surface_get_height(application_surface)));
draw_text( 0, 72, "GUI: "       + string(global.gui_WD)	     + " " + string(global.gui_HG));
draw_text( 0, 96, "Offset: "    + string(global.app_surface_Xoffset)	 + " " + string(global.app_surface_Yoffset));
draw_text( 0,120, "Camera: "    + string(view_wport[0])	     + " " + string(view_hport[0]));
draw_text( 0,144, "Mouse (r): "	+ string(mouse_x)            + " " + string(mouse_y));
draw_text( 0,168, "Mouse (g): " + string(obj_cursor.gui_x)	 + " " + string(obj_cursor.gui_y));
draw_text( 0,192, "Conv: "	    + string(cam_cvr));*/

if(instance_exists(obj_camera) and obj_camera.zoom != 1) {
	var zm = obj_camera.zoom;
	
	if(zm != 1) {
		draw_set_halign(fa_left);
		draw_set_valign(fa_middle);
		draw_set_font(fn_ide);
		
		var text = string(round(zm * 100)) + "%";
		var scale = 1;
		draw_text_transformed(global.gui_WD - string_width(text) * scale, 2 + string_height(text) * scale * 0.5, text, scale, scale, 0);
		
		draw_set_font(-1);
		draw_set_valign(fa_top);
	}
}

//draw_rectangle(1,1,global.gui_WD-1,global.gui_HG-1,true);