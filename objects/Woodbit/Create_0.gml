/// @description Insert description here
// You can write your code in this editor
depth = -y;

initialised = false;

var ran_x = irandom_range(-12, 12);

my_path = path_add();
path_add_point(my_path, x, y, 16);
path_add_point(my_path, x + ran_x, y - 16, 16);
path_add_point(my_path, x + ran_x, y, 16);

path_set_precision(my_path, 8);
path_set_closed(my_path, false);
path_start(my_path, 16, 0, 0);

alarm_set(0, room_speed * 300);