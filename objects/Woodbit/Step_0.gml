/// @description Insert description here
// You can write your code in this editor
depth = -y;
if (path_index == -1) {
	initialised = true;
}

if (initialised) {
	if (instance_place(x, y, Woodbit)) {
		move_outside_all(irandom(360), 2);
	}
}