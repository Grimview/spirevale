/// @description Create the local player.
// Establish the movement macros.
#macro LEFT 1
#macro RIGHT 2
#macro UP 3
#macro DOWN 4

// Establish the player state enum.
enum player_state {
	idle,
	walking,
	attacking
}

enum action {
	none,
	drink
}

state = player_state.idle;

// Create movement input handles.
movement_inputs[0] = ord("D");
movement_inputs[1] = ord("W");
movement_inputs[2] = ord("A");
movement_inputs[3] = ord("S");

// Store player's movement input.
move_xinput = 0;
move_yinput = 0;

move_speed = 0.8;

// Store player's direction.
facing = DOWN;

// Start thirst ticker.
// alarm_set(0, room_speed * 10);

current_action = action.none;

// Chat
speaking = false;
message = "";
character = "_";
display = "";
target = noone;

audio_listener_orientation(0, 1, 0, 0, 0, 1);

wellbeing = 0;
maxWellbeing = 0;
thirst = 0;
maxThirst = 0;
hunger = 0;
maxHunger = 0;
woodcutting = 0;
maxWoodcutting = 0;
woodcuttingExp = 0;
maxWoodcuttingExp = 0;

player_spawn();