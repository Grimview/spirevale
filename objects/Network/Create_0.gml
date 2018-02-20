/// @description Insert description here
// You can write your code in this editor
savedBuffer = buffer_create(1, buffer_grow, 1);
reading = 0;
cutbuffer = buffer_create(1, buffer_grow, 1);
socket = network_create_socket(network_socket_tcp);

// Connect to the server.
network_connect_raw(socket, "127.0.0.1", 8082);