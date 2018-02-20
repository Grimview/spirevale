var message = argument0;

var chat_packet = buffer_create(1, buffer_grow, 1);
buffer_write(chat_packet, buffer_string, "chat");
buffer_write(chat_packet, buffer_string, message);

network_write(Network.socket, chat_packet);