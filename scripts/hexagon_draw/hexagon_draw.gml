///@description Draws an hexagon ds_object (ds_map)
///@param id
{
var _hex = argument0;

if(ds_exists(_hex, ds_type_map)) {
	var _x = _hex[? "X"];
	var _y = _hex[? "Y"];
	var _l = _hex[? "Looks"];   
	
	var _plr  = _hex[? "Player"];
	var _cons = _hex[? "Connect"];
	
	var _type = _hex[? "Type"]; // Type of the hexagon
	var _side = _hex[? "Side"]; // Side of the board
	var _town = -1;             // Is there a town here
	var _resr = -1;
	
	if(_type == slot_type.neutral) { _town = hexagon_rule_get(_hex, rule.territory); }
	if(_type == slot_type.neutral) { _resr = hexagon_rule_get(_hex, reward.points); }
	
	#region Calculate territory side offset
	var _trr_off = 0;
	
	if(_side != slot_side.neutral) {
		if(_side == slot_side.left) {
			_trr_off = -tile_size;
		}
		else {
			_trr_off = tile_size;
		}
	}
	#endregion
	
	#region Hexagon
	var _spr = spr_hex;
	var _con = _cons[0] or _cons[1];
	
	// If it is a player's territory
	if(_trr_off != 0) {
		var _ind = 3 + _type;
		draw_sprite(_spr, _ind, _x + _trr_off, _y);
		draw_sprite(_spr, (_con ? _plr + 1 : 0), _x, _y);
	}
	
	// Town
	else if(is_array(_town)) {
		draw_sprite(_spr, 7, _x, _y);
	}
	
	// Resource
	else if(is_array(_resr)) {
		draw_sprite(_spr, 6, _x, _y);
	}
	
	else {
		draw_sprite(_spr, (_con ? _plr + 1 : 0), _x, _y);
	}
	#endregion
	
	#region Red territory and Town back
	// Red territory
	if((_type == slot_type.red or _type == slot_type.blue_red) and _trr_off != 0) {
		draw_sprite(spr_territory_red, _l, _x + _trr_off, _y);
	}
	
	// Town
	else if(is_array(_town)) {
		draw_sprite(spr_hotel_back, _l, _x, _y);
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
	if((_type == slot_type.blue or _type == slot_type.blue_red) and _trr_off != 0) {
		draw_sprite(spr_territory_blue, _l, _x + _trr_off, _y);
	}
	
	// Town
	else if(is_array(_town)) {
		draw_sprite(spr_hotel_front, _l, _x, _y);
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