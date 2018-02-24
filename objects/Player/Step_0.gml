/// @description Player logic.
// You can write your code in this editor
depth = -y;

var move_speed_this_frame = move_speed * global.dt;

if (state != player_state.attacking && !speaking) {
	move_xinput = 0;
	move_yinput = 0;
	
	for (var i = 0; i < array_length_1d(movement_inputs); i++) {
		var this_key = movement_inputs[i];
		if (keyboard_check(this_key)) {
			var this_angle = i * 90;
			move_xinput += lengthdir_x(1, this_angle);
			move_yinput += lengthdir_y(1, this_angle);
		
			switch (this_key) {
				case ord("D"):
					facing = RIGHT;
				break;
			
				case ord("W"):
					facing = UP;
				break;
			
				case ord("A"):
					facing = LEFT;
				break;
			
				case ord("S"):
					facing = DOWN;
				break;
			}
			
			if !(audio_is_playing(a_fx_footsteps)) {
				audio_play_sound(a_fx_footsteps, 10, false);
			}
		}
	}
	
	if (point_distance(0, 0, move_xinput, move_yinput) > 0) {
		state = player_state.walking;
	} else {
		if (state != player_state.attacking) {
			state = player_state.idle;
			audio_stop_sound(a_fx_footsteps);
		}
	}
}

switch (state) {
	case player_state.idle:
		image_index = 0;
		image_speed = 0;
	
		if (keyboard_check(vk_control)) {
			state = player_state.attacking;
			audio_play_sound(a_fx_swing, 5, false);
		}
	break;
	
	case player_state.walking:
		image_speed = 1;
		
		switch (facing) {
			case RIGHT:
				sprite_index = sprHeroRight;
			break;
			
			case UP:
				sprite_index = sprHeroUp;
			break;
			
			case LEFT:
				sprite_index = sprHeroLeft;
			break;
			
			case DOWN:
				sprite_index = sprHeroDown;
			break;
		}
		
		var move_dir = point_direction(0,0,move_xinput,move_yinput);
	    x += lengthdir_x(move_speed_this_frame, move_dir);
	    y += lengthdir_y(move_speed_this_frame, move_dir);
		
		player_set_location(x, y, facing);
	break;
	
	case player_state.attacking:
		image_speed = 1;
		
		if (sprite_index == sprHeroAttackDown || sprite_index == sprHeroAttackLeft || sprite_index == sprHeroAttackRight || sprite_index == sprHeroAttackUp) {
			if (image_index == 3) {
				switch (facing) {
					case RIGHT:
						instance_create_layer(x + 16, y - 8, "Instances", Hitbox);
					break;
			
					case UP:
						instance_create_layer(x, y - 24, "Instances", Hitbox);
					break;
			
					case LEFT:
						instance_create_layer(x - 16, y - 8, "Instances", Hitbox);
					break;
			
					case DOWN:
						instance_create_layer(x, y + 8, "Instances", Hitbox);
					break;
				}
			}
		}
		
		switch (facing) {
			case RIGHT:
				sprite_index = sprHeroAttackRight;
			break;
			
			case UP:
				sprite_index = sprHeroAttackUp;
			break;
			
			case LEFT:
				sprite_index = sprHeroAttackLeft;
			break;
			
			case DOWN:
				sprite_index = sprHeroAttackDown;
			break;
		}
	break;
}

if (distance_to_object(Collision_01) < 1 || distance_to_object(Collision_02) < 1) {
	if (thirst < 100) {
		current_action = action.drink;
	} else {
		current_action = action.none;
	}
} else {
	if (current_action == action.drink) {
		current_action = action.none;
	}
}

// Typing
if !(speaking) {
	if (keyboard_check_released(ord("T"))) {		
		speaking = true;
		keyboard_string = "";
		display = character;
	}
} else {
	if (keyboard_check_released(vk_enter)) {
		if (message != "") {
			with (NPC) {
				closure = true;
			}
			
			player_say(message);
			message = "";
			display = "";
			speaking = false;
		}
	} else if (keyboard_check(vk_backspace)) {
		message = string_copy(message, 1, string_length(message) - 1);
		display = message + character;
	} else if (keyboard_check(vk_anykey)) {
		message += keyboard_string;
		display = message + character;
		keyboard_string = "";
	}
}

audio_listener_position(x, y, 0);