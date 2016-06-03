/// set_giblets()

/*
0 = relative x position
1 = relative y position
2 = force direction
3 = force distance
4 = image index
5 = rotate direction
6 = rotate speed
7 = image angle
*/

// head
giblets[0, 0] = x + 2 * x_scale;
giblets[0, 1] = y - 10;
giblets[0, 2] = point_direction(force_x, force_y + 20, giblets[0, 0], giblets[0, 1]);
giblets[0, 3] = point_distance(force_x, force_y, giblets[0, 0], giblets[0, 1]);
giblets[0, 4] = 0;
giblets[0, 5] = choose(1, -1); // 0;
giblets[0, 6] = random(20); // 0;
giblets[0, 7] = 0;
// jet
giblets[1, 0] = x - 10 * x_scale;
giblets[1, 1] = y - 4;
giblets[1, 2] = point_direction(force_x, force_y + 20, giblets[1, 0], giblets[1, 1]);
giblets[1, 3] = point_distance(force_x, force_y, giblets[1, 0], giblets[1, 1]);
giblets[1, 4] = 1;
giblets[1, 5] = choose(1, -1);
giblets[1, 6] = random(20);
giblets[1, 7] = 0;
// gun
giblets[2, 0] = x + 12 * x_scale;
giblets[2, 1] = y - 5;
giblets[2, 2] = point_direction(force_x, force_y + 20, giblets[2, 0], giblets[2, 1]);
giblets[2, 3] = point_distance(force_x, force_y, giblets[2, 0], giblets[2, 1]);
giblets[2, 4] = 2;
giblets[2, 5] = choose(1, -1);
giblets[2, 6] = random(20);
giblets[2, 7] = 0;

giblets_size = array_height_2d(giblets);
