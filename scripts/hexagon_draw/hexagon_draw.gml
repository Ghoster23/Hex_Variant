///@description Draws an hexagon ds_object (ds_map)
///@param id
{
var _hex = argument0;

if(ds_exists(_hex, ds_type_map)) {
	var _x = _hex[? "X"];
	var _y = _hex[? "Y"];
	var _l = _hex[? "Looks"];   
	
	var _plr = _hex[? "Player"];
	var _con = _hex[? "Connect"];
	
	draw_sprite(spr_hex, (_con[0] or _con[1] ? _plr + 1 : 0), _x, _y); // Draw hexagon
	
	draw_set_color(c_white);
	
	var _type = _hex[? "Type"]; // Type of the hexagon
	var _town = -1;             // Is there a town here
	var _resr = -1;
	
	if(_type == slot_type.neutral) { _town = hexagon_rule_get(_hex, rule.territory); }
	if(_type == slot_type.neutral) { _resr = hexagon_rule_get(_hex, reward.points); }
	
	#region Red territory and Town back
	// Red territory
	if(_type == slot_type.red or _type == slot_type.blue_red) {
		draw_sprite(spr_territory_red, _l, _x, _y);
	}
	
	// Town
	else if(is_array(_town)) {
		draw_sprite(spr_town_back, _l, _x, _y);
	}
	
	// Resource
	else if(is_array(_resr)) {
		draw_sprite(spr_monument_back, _l, _x, _y);
	}
	#endregion
	
	#region Draw player pieces
	var _player = _hex[? "Player"];
	
	if(_player != -1) {
		draw_sprite(spr_piece, _player, _x, _y); // Draw piece
	}
	#endregion
	
	#region Blue territory and Town front
	// If it is blue territory
	if(_type == slot_type.blue or _type == slot_type.blue_red) {
		draw_sprite(spr_territory_blue, _l, _x, _y);
	}
	
	// Town
	else if(is_array(_town)) {
		draw_sprite(spr_town_front, _l, _x, _y);
	}
	// Resource
	else if(is_array(_resr)) {
		draw_sprite(spr_monument_front, _l, _x, _y);
	}
	#endregion
	
	/*
	draw_set_valign(fa_middle);
	draw_set_halign(fa_center);
	draw_text(_x, _y, "X- " + string(_hex[? "Grid_X"]) + "\nY- " + string(_hex[? "Grid_Y"]));
	*/
	//draw_text(_x, _y, _hex);
	return 1;
}

return 0;
}