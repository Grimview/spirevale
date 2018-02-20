/// @description box_create(sprite, x1, y1, x2, y2);
/// @argument sprite
/// @argument x1
/// @argument y1
/// @argument x2
/// @argument y2

var _size = sprite_get_width(argument[0]) / 3;
var _x1 = argument[1];
var _y1 = argument[2];
var _x2 = argument[3];
var _y2 = argument[4];
var _w = _x2 - _x1;
var _h = _y2 - _y1;
var _columns = _w div _size;
var _rows = _h div _size;

// Corners
// Top Left
draw_sprite_part(argument[0], 0, 0, 0, _size, _size, _x1, _y1);
// Top Right
draw_sprite_part(argument[0], 0, _size * 2, 0, _size, _size, _x1 + (_columns * _size), _y1);
// Bottom Left
draw_sprite_part(argument[0], 0, 0, _size * 2, _size, _size, _x1, _y1 + (_rows * _size));
// Bottom Right
draw_sprite_part(argument[0], 0, _size * 2, _size * 2, _size, _size, _x1 + (_columns * _size), _y1 + (_rows * _size));

// Edges
for (var i = 1; i < (_rows); i++) {
	// Left Edge
	draw_sprite_part(argument[0], 0, 0, _size, _size, _size, _x1, _y1 + (i * _size));
	// Right Edge
	draw_sprite_part(argument[0], 0, _size * 2, _size, _size, _size, _x1 + (_columns * _size), _y1 + (i * _size));
}

for (var i = 1; i < (_columns); i++) {
	// Top Edge
	draw_sprite_part(argument[0], 0, _size, 0, _size, _size, _x1 + (i * _size), _y1);
	// Bottom Edge
	draw_sprite_part(argument[0], 0, _size, _size * 2, _size, _size, _x1 + (i * _size), _y1 + (_rows * _size));
}

// Middle
for (var i = 1; i < (_columns); i++) {
	for (var j = 1; j < (_rows); j++) {
		draw_sprite_part(argument[0], 0, _size, _size, _size, _size, _x1 + (i * _size), _y1 + (j * _size));
	}
}