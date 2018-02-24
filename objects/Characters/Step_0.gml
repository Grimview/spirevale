if (mouse_check_button_released(mb_left)) {	
	if (instance_exists(buttonCreate)) {
		if (buttonCreate.focused) {
			create_character(nameField.message);
		}
	} else if (instance_exists(buttonPlay)) {
		if (buttonPlay.focused) {
			Client.name = name;
			
			room_goto(rm_map_home);
		}
	}
}