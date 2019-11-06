///@argument pixelperfect
///@argument working_wd
///@argument working_hg
///@argument game_wd
///@argument game_hg
///@argument adjust_gui
{
#region App Surface
application_surface_draw_enable(false);

var _pp = argument0;

var _working_wd = argument1;
var _working_hg = argument2;

var _game_wd = argument3;
var _game_hg = argument4;

var _ag = argument5;

var _working_asr = _working_wd / _working_hg;
var _game_asr    = _game_wd    / _game_hg;

var _full_ratio = [ _working_wd / _game_wd, _working_hg / _game_hg]; // Game to Working width and height scaling ratios

var _real_ratio = 1; // Game to Working scaling ratio
var _precision  = 1; // Pixel Perfect Scaling precision

var _surface_wd = _game_wd;
var _surface_hg = _game_hg;

switch room {
	default:
		if(_game_asr <= _working_asr){
			if(not _pp or _full_ratio[1] < 1){
				_real_ratio = _full_ratio[1];
				
			}else {
				_real_ratio = floor(_precision * _full_ratio[1]) / _precision;
				
			}
			
			_surface_hg = _game_hg    * _real_ratio;
			_surface_wd = _surface_hg * _game_asr;
			
		}else {
			if(not _pp or _full_ratio[0] < 1){
				_real_ratio = _full_ratio[0];
				
			}else {
				_real_ratio = floor(_precision * _full_ratio[0]) / _precision;
				
			}
			
			_surface_wd = _game_wd    * _real_ratio;
			_surface_hg = _surface_wd / _game_asr;
		}
	break;
}

surface_resize(application_surface, _surface_wd, _surface_hg);

global.app_surface_Xoffset = (_working_wd - _surface_wd) / 2;
global.app_surface_Yoffset = (_working_hg - _surface_hg) / 2;
#endregion

#region GUI
if(_ag){
	display_set_gui_size(_surface_wd, _surface_hg);
	
	global.gui_WD = _surface_wd;
	global.gui_HG = _surface_hg;

	global.gui_ratio = 1;
}
#endregion
}