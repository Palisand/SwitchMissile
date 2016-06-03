/// missile_transfer_stats(target)

var target = argument0;

// generalize to *mine* and *explosion*
/*
target.missile_info[0] = type;
target.missile_info[1] = x;
target.missile_info[2] = y;
target.missile_info[3] = direction;
target.missile_info[4] = image_angle;
target.missile_info[5] = color;
target.missile_info[6] = owner_num;
target.missile_info[7] = force;
*/

target.missile_x = x;
target.missile_y = y;
target.missile_force = force;
target.missile_dir = direction;
target.missile_rot = image_angle;
target.missile_color = color;
