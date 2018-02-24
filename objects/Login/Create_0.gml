/// @description Create Email & Password Fields, and Login & Register Buttons
#region Create and configure 'email' and 'password' fields.
var email = instance_create_layer(216, 128, "Instances", Textbox);
email.instanceID = 0;
email.placeholder = "Email";
email.width = 208;

var password = instance_create_layer(216, 156, "Instances", Textbox);
password.password = true;
password.instanceID = 1;
password.placeholder = "Password";
password.width = 208;

fields[0] = email;
fields[1] = password;
#endregion

loginButton = instance_create_layer(room_width / 2 - 32, 180, "Instances", Button);
loginButton.text = "Login";

registerButton = instance_create_layer(room_width / 2 + 32, 180, "Instances", Button);
registerButton.text = "Register";