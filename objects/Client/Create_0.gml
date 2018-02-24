/// @description Insert description here
// You can write your code in this editor
#macro HANDSHAKE 0
#macro REGISTER 1
#macro LOGIN 2
#macro CHARACTER 3
#macro NEWCHARACTER 4
#macro SPAWN 5
#macro POSITION 6
#macro CHAT 7

var ip = "127.0.0.1";
var port = 8082;

network_connect_raw(socket, ip, port);