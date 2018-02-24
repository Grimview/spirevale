/// @description Field switch shortcut keys and buttons.
#region Shift between fields.
if (fields[0].focused) {
	selectedField = 0;
} else if (fields[1].focused) {
	selectedField = 1;
} else {
	selectedField = -1;
}

if (keyboard_check(vk_shift)) {
	if (keyboard_check_released(vk_tab)) {
		if (selectedField > 0) {
			selectedField -= 1;
	
			with (Textbox) {
				blink = false;
				focused = false;
		
				if (other.selectedField == instanceID) {
					keyboard_string = message;
					blink = true;
					cooldown = 30;
					focused = true;
				}
			}
		}
	}
} else {
	if (keyboard_check_released(vk_tab)) {		
		if (selectedField < 1) {
			selectedField += 1;
	
			with (Textbox) {
				blink = false;
				focused = false;
		
				if (other.selectedField == instanceID) {
					keyboard_string = message;
					blink = true;
					cooldown = 30;
					focused = true;
				}
			}
		}
	}
}
#endregion

#region Detect Button Presses
if (mouse_check_button_released(mb_left)) {
	if (loginButton.focused) {
		player_login(fields[0].message, fields[1].message);
	} else if (registerButton.focused) {
		room_goto(RegisterScene);
	}
}
#endregion