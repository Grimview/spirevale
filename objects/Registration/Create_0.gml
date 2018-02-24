/// @description Create Registration Fields, and Register & Back Buttons
#region Create and configure registration fields.
var firstName = instance_create_layer(216, 112, "Instances", Textbox);
firstName.instanceID = 0;
firstName.placeholder = "First name";

var lastName = instance_create_layer(328, 112, "Instances", Textbox);
lastName.instanceID = 1;
lastName.placeholder = "Last name";

var month = instance_create_layer(216, 136, "Instances", Textbox);
month.instanceID = 2;
month.placeholder = "Birth Month";
month.width = 58;

var day = instance_create_layer(290, 136, "Instances", Textbox);
day.instanceID = 3;
day.placeholder = "Day";
day.width = 58;

var year = instance_create_layer(364, 136, "Instances", Textbox);
year.instanceID = 4;
year.placeholder = "Year";
year.width = 58;

var email = instance_create_layer(216, 160, "Instances", Textbox);
email.instanceID = 5;
email.placeholder = "Email";
email.width = 208;

var confirmEmail = instance_create_layer(216, 184, "Instances", Textbox);
confirmEmail.instanceID = 6;
confirmEmail.placeholder = "Confirm Email";
confirmEmail.width = 208;

var password = instance_create_layer(216, 208, "Instances", Textbox);
password.instanceID = 7;
password.placeholder = "Password";
password.password = true;

var confirmPassword = instance_create_layer(328, 208, "Instances", Textbox);
confirmPassword.instanceID = 8;
confirmPassword.placeholder = "Confirm Password";
confirmPassword.password = true;

fields[0] = firstName;
fields[1] = lastName;
fields[2] = month;
fields[3] = day;
fields[4] = year;
fields[5] = email;
fields[6] = confirmEmail;
fields[7] = password;
fields[8] = confirmPassword;
#endregion

registerButton = instance_create_layer(room_width / 2, 232, "Instances", Button);
registerButton.text = "Register";

backButton = instance_create_layer(32, 16, "Instances", Button);
backButton.text = "Back";