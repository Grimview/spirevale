if (point_in_rectangle(mouse_x, mouse_y, x - (width / 2), y - (height / 2), x + (width / 2), y + (height / 2))) {
	focused = true;
} else {
	focused = false;
}

if (focused) {
	if (colourMerge < 1) {
		colourMerge += 1 / room_speed * 6;
	} else {
		colourMerge = 1;
	}
} else {
	if (colourMerge > 0) {
		colourMerge -= 1 / room_speed * 6;
	} else {
		colourMerge = 0;
	}
}