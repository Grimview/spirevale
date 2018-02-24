/// @description Blink Indicator, Typing, and Focus
if (mouse_check_button_released(mb_left)) {
	#region Focus Textbox
	if (point_in_rectangle(mouse_x, mouse_y, x, y - 12, x + width, y)) {
		with (Textbox) {
			focused = false;
		}
		
		keyboard_string = message;
		blink = true;
		blinkCooldown = 30;
		focused = true;
	} else {
		keyboard_string = "";
		blink = false;
		focused = false;
	}
	#endregion
}

if (focused) {
	#region Blink Indicator
	if (blinkCooldown <= 0) {
		blink = !blink;
		blinkCooldown = 30;
	} else {
		blinkCooldown -= 1;
	}
	#endregion
	
	#region Detect Typing
	if (keyboard_check(vk_anykey)) {
		message = keyboard_string;
	}
	#endregion
	
	#region Animate Focus
	if (placeholder_y > y - 12) {
		placeholder_y -= 12 / room_speed * 8;
		placeholder_x -= 1 / room_speed * 8;
		placeholder_scale -= 0.10 / room_speed * 8;
		placeholder_alpha += 0.35 / room_speed * 8;
		placeholder_colour += 1 / room_speed * 2;
	} else {
		placeholder_y = y - 12;
		placeholder_x = x + 1;
		placeholder_scale = 0.40;
		placeholder_alpha = 1;
		placeholder_colour = 1;
	}
} else {
	if (message == "") {
		if (placeholder_y < y) {
			placeholder_y += 12 / room_speed * 8;
			placeholder_x += 1 / room_speed * 8;
			placeholder_scale += 0.10 / room_speed * 8;
			placeholder_alpha -= 0.35 / room_speed * 8;
			placeholder_colour -= 1 / room_speed * 2;
		} else {
			placeholder_y = y;
			placeholder_x = x + 2;
			placeholder_scale = 0.50;
			placeholder_alpha = 0.65;
			placeholder_colour = 0;
		}
	}
	#endregion
}