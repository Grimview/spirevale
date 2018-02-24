var message = argument0;

var chat_packet = buffer_create(1, buffer_grow, 1);
buffer_write(chat_packet, buffer_u8, CHAT);
buffer_write(chat_packet, buffer_string, message);

network_write(Client.socket, chat_packet);