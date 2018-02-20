/// @description Create variables for toggle.

// ----------- //
// - CONTENT - //
// ----------- //

// Store state of toggle.
on = false;


// --------- //
// - LOGIC - //
// --------- //

// Store state of activation of toggle.
activated = false;
// Store time it takes (nths of a second) to activate toggle.
activation_time = 1;

// Store x position of toggle nob (Between 4 to (width - 4)).
x_pos = 4;
// Store size of toggle (0 - 1).
size = 0;


// ----------- //
// - DRAWING - //
// ----------- //

// Store width of toggle.
width = 15;
// Store height of toggle.
height = 6;

// Store colour state of toggle background.
colour = c_gray;
// Store colour state of toggle nob.
toggle_colour = c_white;