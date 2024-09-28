class Asteroid {
    I32 x;
    I32 y;
    I32 z;
    F64 angle;
    F64 speed;
    Bool active;
    I8 size;
};

Asteroid asteroids[10];

U0 InitializeAsteroids() {
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
    I32 i;
    for (i = 0; i < 10; i++) {
        if (!asteroids[i].active) {
            asteroids[i].x = Rand() % 640; // Random position outside the screen
            asteroids[i].y = Rand() % 480;
            asteroids[i].angle = Rand() % 360;
            asteroids[i].speed = 5 + Rand() % 5; // Random speed between 5 and 10
            asteroids[i].active = TRUE;
            break;
        }
    }
}

U0 SplitAsteroid(I32 index) {
    if (asteroids[index].size > 1) {
        I32 i;
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
    I32 i;
    for (i = 0; i < 10; i++) {
        if (asteroids[i].active) {
            asteroids[i].x += asteroids[i].speed * Cos(asteroids[i].angle);
            asteroids[i].y += asteroids[i].speed * Sin(asteroids[i].angle);

            // Deactivate asteroid if it goes offscreen
            if (asteroids[i].x < 0 || asteroids[i].x > 640 || asteroids[i].y < 0 || asteroids[i].y > 480) {
                asteroids[i].active = FALSE;
            }
        }
    }
}
