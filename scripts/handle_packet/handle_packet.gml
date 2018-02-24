/// arg data buffer
var command = buffer_read(argument0, buffer_u8);
show_debug_message("command: " + string(command));

switch (command) {
	#region Handshake
	case HANDSHAKE:
		// server_time = buffer_read(argument0, buffer_string);
	
		// DEBUG: Show the time that the connection to the server is established.
		// show_debug_message("Server welcomes you @ " + server_time);
	break;
	#endregion
	
	#region Register
	case REGISTER:
		var successful = buffer_read(argument0, buffer_u8);
		
		if (successful) {			
			// Show a registration successful notification.
			
			game_restart();
		} else {
			// Show a registration failed notification.
		}
	break;
	#endregion
	
	#region Login
	case LOGIN:
		var successful = buffer_read(argument0, buffer_u8);
		
		if (successful) {
			room_goto(CharacterScene);
		} else {
			instance_destroy(Client);
			
			// Show notification that login failed.
		}
	break;
	#endregion
	
	#region Character List
	case CHARACTER:
		var status = buffer_read(argument0, buffer_u8);
		
		if (status) {
			var character = buffer_read(argument0, buffer_string);
			
			with (Characters) {
				self.name = character;
				
				with (nameField) {
					instance_destroy();
				}
			
				with (buttonCreate) {
					instance_destroy();
				}
			
				buttonPlay = instance_create_layer(room_width / 2, room_height / 2 + 24, "Instances", Button);
				buttonPlay.text = "Play";
			}
		} else {
			with (Characters) {
				buttonCreate = instance_create_layer(room_width / 2, room_height / 2 + 24, "Instances", Button);
				buttonCreate.text = "Create";
				
				nameField = instance_create_layer(216, room_height / 2, "Instances", Textbox);
				nameField.placeholder = "Character name";
				nameField.width = 208;
			}
		}
	break;
	#endregion
	
	#region Spawn
	case SPAWN:
		var name = buffer_read(argument0, buffer_string);
		var targetRoom = buffer_read(argument0, buffer_string);
		var pos_x = buffer_read(argument0, buffer_u16);
		var pos_y = buffer_read(argument0, buffer_u16);
		var wellbeing = buffer_read(argument0, buffer_u16);
		var maxWellbeing = buffer_read(argument0, buffer_u16);
		var thirst = buffer_read(argument0, buffer_u16);
		var maxThirst = buffer_read(argument0, buffer_u16);
		var hunger = buffer_read(argument0, buffer_u16);
		var maxHunger = buffer_read(argument0, buffer_u16);
		var woodcutting = buffer_read(argument0, buffer_u16);
		var maxWoodcutting = buffer_read(argument0, buffer_u16);
		var woodcuttingExp = buffer_read(argument0, buffer_u16);
		var maxWoodcuttingExp = buffer_read(argument0, buffer_u16);
		
		with (Player) {
			self.name = name;
			
			x = real(pos_x);
			y = real(pos_y);
			
			self.wellbeing = real(wellbeing);
			self.maxWellbeing = real(maxWellbeing);
			self.thirst = real(thirst);
			self.maxThirst = real(maxThirst);
			self.hunger = real(hunger);
			self.maxHunger = real(maxHunger);
			self.woodcutting = real(woodcutting);
			self.maxWoodcutting = real(maxWoodcutting);
			self.woodcuttingExp = real(woodcuttingExp);
			self.maxWoodcuttingExp = real(maxWoodcutting);
		}
	break;
	#endregion
	
	#region Position
	case POSITION:
		var name = buffer_read(argument0, buffer_string);
		var pos_x = buffer_read(argument0, buffer_u16);
		var pos_y = buffer_read(argument0, buffer_u16);
		var facing = buffer_read(argument0, buffer_u16);
		
		var foundPlayer = -1;
		
		with (RemotePlayer) {
			if (self.name == name) {
				foundPlayer = id;
				break;
			}
		}
		
		if (foundPlayer != -1) {
			foundPlayer.x = real(pos_x);
			foundPlayer.y = real(pos_y);
			foundPlayer.facing = real(facing);
		} else {
			var playerRemote = instance_create_layer(pos_x, pos_y, "Instances", RemotePlayer)
			playerRemote.name = name;
			
			with (Player) {
				if (self.name != name) {
					player_set_location(x, y, facing);
				}
			}
		}
	break;
	#endregion
	
	#region Logout
	case "logout":
		var name = buffer_read(argument0, buffer_string);
		
		with (RemotePlayer) {
			if (self.name == name) {
				instance_destroy();
			}
		}
	break;
	#endregion
}