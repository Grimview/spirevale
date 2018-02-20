/// @description Draw the toggle.

// --------------- //
// - PILL SHAPES - //
// --------------- //

// Draw white border around toggle.
draw_roundrect_ext(x - 2 - (width / 2) * size, y - 2 - (height / 2) * size,
					x - 2 + ((width / 2) + 4) * size, y - 2 + ((height / 2) + 4) * size,
					(height + 4) * size, (height + 4) * size, false);

// Set draw colour to the toggle's background colour.
draw_set_colour(colour);
// Draw toggle background.
draw_roundrect_ext(x - (width / 2) * size, y - (height / 2) * size, x + (width / 2) * size,
					y + (height / 2) * size, (height) * size, (height) * size, false);


// -------------- //
// - TOGGLE NOB - //
// -------------- //

// Set draw colour to the toggle nob background colour.
draw_set_colour(toggle_colour);
// Draw toggle nob.
draw_circle(x - (width / 2) + x_pos, y, (height - (height / 4)) * size, false);

// Reset draw colour.
draw_set_colour(c_white);