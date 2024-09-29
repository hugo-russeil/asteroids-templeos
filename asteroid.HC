class Asteroid {
    I16 x;
    I16 y;
    U8 z;
    F64 angle;
    U8 speed;
    Bool active;
    U8 size;
};

Asteroid asteroids[10];

U0 InitialiseAsteroids() {
    I8 i;
    for (i = 0; i < 10; i++) {
        asteroids[i].x = 0;
        asteroids[i].y = 0;
        asteroids[i].z = 0;
        asteroids[i].angle = 0;
        asteroids[i].speed = 0;
        asteroids[i].active = FALSE;
        asteroids[i].size = 3; // Default size
    }
}

U0 ActivateAsteroid() {
    U8 i;
    for (i = 0; i < 10; i++) {
        if (!asteroids[i].active) {
            U16 side = RandU16() % 4; // Random side of the screen
            switch (side) {
                case 0:
                    // Random position on the left side of the screen
                    asteroids[i].x = -10; // Slightly offscreen
                    asteroids[i].y = RandI16() % 480;
                    asteroids[i].angle = 0 + (Rand() % 180);
                    break;
                case 1:
                    // Random position on the right side of the screen
                    asteroids[i].x = 650; // Slightly offscreen
                    asteroids[i].y = RandI16() % 480;
                    asteroids[i].angle = 180 + (Rand() % 180);
                    break;
                case 2:
                    // Random position on the top side of the screen
                    asteroids[i].x = RandI16() % 640;
                    asteroids[i].y = -10; // Slightly offscreen
                    asteroids[i].angle = 90 + (Rand() % 180);
                    break;
                case 3:
                    // Random position on the bottom side of the screen
                    asteroids[i].x = RandI16() % 640;
                    asteroids[i].y = 490; // Slightly offscreen
                    asteroids[i].angle = 270 + (Rand() % 180);
                    break;
            }

            asteroids[i].speed = 5 + (RandU16() % 5); // Random speed between 5 and 10
            asteroids[i].active = TRUE;
            break;
        }
    }
}

U0 SplitAsteroid(U8 index) {
    if (asteroids[index].size > 1) {
        U8 i;
        for (i = 0; i < 10; i++) {
            if (!asteroids[i].active) {
                asteroids[i].x = asteroids[index].x;
                asteroids[i].y = asteroids[index].y;
                asteroids[i].angle = asteroids[index].angle + 10;
                asteroids[i].speed = asteroids[index].speed;
                asteroids[i].active = TRUE;
                asteroids[i].size = asteroids[index].size - 1;
                break;
            }
        }
        for (i = 0; i < 10; i++) {
            if (!asteroids[i].active) {
                asteroids[i].x = asteroids[index].x;
                asteroids[i].y = asteroids[index].y;
                asteroids[i].angle = asteroids[index].angle - 10;
                asteroids[i].speed = asteroids[index].speed;
                asteroids[i].active = TRUE;
                asteroids[i].size = asteroids[index].size - 1;
                break;
            }
        }
        asteroids[index].active = FALSE;
    }
}

U0 UpdateAsteroids() {
    U8 i;
    for (i = 0; i < 10; i++) {
        if (asteroids[i].active) {
            asteroids[i].x += asteroids[i].speed * Cos(asteroids[i].angle);
            asteroids[i].y += asteroids[i].speed * Sin(asteroids[i].angle);

            // Deactivate asteroid if it goes too far offscreen
            if (asteroids[i].x < -1000 || asteroids[i].x > 1000 || asteroids[i].y < -1000 || asteroids[i].y > 1000) {
                asteroids[i].active = FALSE;
            }
        }
    }
    ActivateAsteroid;
}
