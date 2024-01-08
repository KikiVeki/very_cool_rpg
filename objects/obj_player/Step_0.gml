key_right = keyboard_check(vk_right) || keyboard_check(ord("D"));
key_left = keyboard_check(vk_left) || keyboard_check(ord("A"));
key_up = keyboard_check(vk_up) || keyboard_check(ord("W"));
key_down = keyboard_check(vk_down) || keyboard_check(ord("S"));

x_speed = (key_right - key_left) * move_speed;
y_speed = (key_down - key_up) * move_speed;


//set sprite
mask_index = sprite[DOWN];
if (x_speed == 0) {
	if(y_speed > 0) face = DOWN;
	if(y_speed < 0) face = UP;
}
if (y_speed > 0 && face == UP) face = DOWN;
if (y_speed < 0 && face == DOWN) face = UP;
if (y_speed == 0) {
	if(x_speed > 0) face = RIGHT;
	if(x_speed < 0) face = LEFT;
}
if (x_speed > 0 && face == LEFT) face = RIGHT;
if (x_speed < 0 && face == RIGHT) face = LEFT;
sprite_index = sprite[face];

//colision
if (place_meeting(x + x_speed, y, obj_wall) == true) {
	x_speed = 0;
}

if (place_meeting(x, y + y_speed, obj_wall) == true) {
	y_speed = 0;
}

x += x_speed;
y += y_speed;



if(x_speed == 0 && y_speed == 0) {
	image_index = 0;
	}