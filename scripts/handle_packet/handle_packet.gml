/// arg data buffer
var command = buffer_read(argument0, buffer_string);
show_debug_message("Networking Event: " + string(command));

switch (command) {
	case "HELLO":
		server_time = buffer_read(argument0, buffer_string);
		room_goto_next();
		show_debug_message("Server welcomes you @ " + server_time);
	break;
	
	case "LOGIN":
		var status, target_room, target_x, target_y, name, hp, maxHp,
			thirst, maxThirst, hunger, maxHunger, goto_room, player,
			woodcutting, maxWoodcutting, woodcuttingExp, maxWoodcuttingExp;

		status = buffer_read(argument0, buffer_string);
		
		if (status == "TRUE") {
			// Location and Name
			target_room = buffer_read(argument0, buffer_string);
			target_x = real(buffer_read(argument0, buffer_u16));
			target_y = real(buffer_read(argument0, buffer_u16));
			name = buffer_read(argument0, buffer_string);
			
			// Metabolism
			hp = real(buffer_read(argument0, buffer_u16));
			maxHp = real(buffer_read(argument0, buffer_u16));
			thirst = real(buffer_read(argument0, buffer_u16));
			maxThirst = real(buffer_read(argument0, buffer_u16));
			hunger = real(buffer_read(argument0, buffer_u16));
			maxHunger = real(buffer_read(argument0, buffer_u16));
			
			// Skills
			woodcutting = real(buffer_read(argument0, buffer_u16));
			maxWoodcutting = real(buffer_read(argument0, buffer_u16));
			woodcuttingExp = real(buffer_read(argument0, buffer_u16));
			maxWoodcuttingExp = real(buffer_read(argument0, buffer_u16));
			
			/*
			room_goto(rm_user);
			
			gui = instance_create_layer(0, 0, "Instances", UserScreen);
			gui.name = name;
			gui.woodcutting = woodcutting;
			gui.maxWoodcutting = maxWoodcutting;
			*/
			
			//*
			// Spawn at the player's stored location.
			goto_room = asset_get_index(target_room);
			room_goto(goto_room);
			
			// Create a player from the database.
			player = instance_create_layer(target_x, target_y, "Instances", Player);
			player.name = name;
			player.wellbeing = hp;
			player.maxWellbeing = maxHp;
			player.thirst = thirst;
			player.maxThirst = maxThirst;
			player.hunger = hunger;
			player.maxHunger = maxHunger;
			player.woodcutting = woodcutting;
			player.maxWoodcutting = maxWoodcutting;
			player.woodcuttingExp = woodcuttingExp;
			player.maxWoodcuttingExp = maxWoodcuttingExp;
			//*/
		} else {
			show_message("Login failed.");
		}
	break;
	
	case "REGISTER":
		status = buffer_read(argument0, buffer_string);
		
		if (status == "TRUE") {
			show_message("Registration successful.");
		} else {
			show_message("Registration failed.");
		}
	break;
	
	case "POSITION":
		username = buffer_read(argument0, buffer_string);
		target_x = buffer_read(argument0, buffer_u16);
		target_y = buffer_read(argument0, buffer_u16);
		var facing = buffer_read(argument0, buffer_u16);
		
		foundPlayer = -1;
		
		with (RemotePlayer) {
			if (self.name == other.username) {
				other.foundPlayer = id;
				break;
			}
		}
		
		if (foundPlayer != -1) {
			foundPlayer.x = target_x;
			foundPlayer.y = target_y;
			foundPlayer.facing = facing;
		} else {
			var playerRemote = instance_create_layer(target_x, target_y, "Instances", RemotePlayer)
			playerRemote.name = username;
		}
	break;
	
	case "HEALTH":
		hp = real(buffer_read(argument0, buffer_u16));
		maxHp = real(buffer_read(argument0, buffer_u16));
		
		Player.wellbeing = hp;
		Player.maxWellbeing = maxHp;
	break;
	
	case "THIRST":
		thirst = real(buffer_read(argument0, buffer_u16));
		maxThirst = real(buffer_read(argument0, buffer_u16));
		
		Player.thirst = thirst;
		Player.maxThirst = maxThirst;
	break;
	
	case "EXP":
		woodcuttingExp = real(buffer_read(argument0, buffer_u16));
		maxWoodcuttingExp = real(buffer_read(argument0, buffer_u16));
		woodcutting = real(buffer_read(argument0, buffer_u16));
		
		audio_play_sound(a_fx_exp, 10, false);
		Player.woodcuttingExp = woodcuttingExp;
		Player.maxWoodcuttingExp = maxWoodcuttingExp;
		
		if (Player.woodcutting != woodcutting) {
			audio_play_sound(a_fx_levelup, 10, false);
		}
		
		Player.woodcutting = woodcutting;
	break;
}