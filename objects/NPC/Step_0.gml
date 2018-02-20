/// @description Insert description here
// Start listening if a player is near.
if (point_in_circle(Player.x, Player.y, x, y, listen_distance)) {
	listening = true;
} else {
	listening = false;
}

// If listening
if (listening) {
	// If a player is speaking
	if (Player.speaking) {
		// Remember what the player is saying.
		received_message = Player.message;
	}
}

// If ai has received closure that the message is over
// and was directed towards it:
if (closure) {
	// Analyse the received message
	if (received_message == "hey") {
		display = "Hi!";
	} else if (received_message == "who are you?") {
		display = "I am artificial intelligence.";
	} else {
		display = "I don't know what to say.";
	}
	
	// Destroy message after 5 seconds.
	alarm_set(0, room_speed * 5);
	// Forget the received message.
	received_message = "";
	// Reset the closure flag.
	closure = false;
}