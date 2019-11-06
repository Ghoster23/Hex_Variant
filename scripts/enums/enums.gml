enum rule {
	none       = -1,
	connect    =  0,
	territory  =  1,
	count
}

enum reward {
	none       = -1,
	points     =  0,
	multiplier =  1,
	territory  =  2,
	count
}

enum slot_type {
	neutral  = -1,
	blue     = 0,
	red      = 1,
	blue_red = 2,
	count
}

enum slot_side {
	neutral  = -1,
	left     = 0,
	right    = 1,
	both     = 2,
	count
}