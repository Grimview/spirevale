/// @description Toggle switch logic.

// ---------------- //
// - TOGGLE LOGIC - //
// ---------------- //

// If toggle is on:
if (on) {
	// Set background colour to green.
	colour = c_green;
	// Set toggle nob colour to lime.
	toggle_colour = c_lime;
	
	// If toggle nob is not at on position:
	if (x_pos < width - 4) {
		// Move toggle nob right.
		x_pos += (width - 4) / room_speed * 12;
	} else {
		// Set toggle nob to on position.
		x_pos = width - (height / 2);
	}
} else {
	// Set background colour to gray.
	colour = c_gray;
	// Set toggle nob colour to white.
	toggle_colour = c_white;
	
	// If toggle nob is not at off position:
	if (x_pos > height / 2) {
		// Move toggle nob left.
		x_pos -= (width - 4) / room_speed * 12;
	} else {
		// Set toggle nob to off position.
		x_pos = (height / 2);
	}
}

// If left mouse button is detected as released:
if (mouse_check_button_released(mb_left)) {
	// If mouse is over toggle or toggle nob:
	if (point_in_rectangle(mouse_x, mouse_y, x - (width / 2) - 2, y - (height / 2) - 2,
		x + (width / 2) + 2, y + (height / 2) + 2)) {
		// Switch toggle state.
		on = !on;
	}
}


// -------------------- //
// - ACTIVATION LOGIC - //
// -------------------- //

// If toggle is not activated:
if !(activated) {
	// If toggle is less than full size:
	if (size < 1) {
		// Increase toggle size.
		size += 1 / room_speed * activation_time;
	} else {
		// Set toggle to full size.
		size = 1;
		// Set toggle activation to true.
		activated = true;
	}
}