/// @description Field switch shortcut keys and buttons.
#region Shift between fields.
if (keyboard_check(vk_shift)) {
	if (keyboard_check_released(vk_tab)) {
		if (selectedField > -1) {
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
		if (selectedField < 8) {
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
	if (registerButton.focused) {
		if (fields[5].message == fields[6].message && fields[7].message == fields[8].message) {
			player_register(fields[0].message, fields[1].message, fields[2].message, fields[3].message, fields[4].message, fields[5].message, fields[7].message);
		}
	} else if (backButton.focused) {
		instance_destroy(Client);
		
		room_goto(LoginScene);
	}
}
#endregion