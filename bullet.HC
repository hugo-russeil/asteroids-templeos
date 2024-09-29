#include "./spaceship.HC"

class Bullet{
    I16 x;
    I16 y;
    U8 z;
    F64 angle;
    U8 speed;
    Bool active;
};

Bullet bullets[10];

U0 InitialiseBullets(){
    U8 i;
    for (i = 0; i < 10; i++) {
        bullets[i].x = 0;
        bullets[i].y = 0;
        bullets[i].z = 0;
        bullets[i].angle = 0;
        bullets[i].active = FALSE;
        bullets[i].speed = 0;
    }
}

U0 ShootBullet() {
    U8 i;
    for (i = 0; i < 10; i++){
        if (!bullets[i].active){
            bullets[i].x = x;
            bullets[i].y = y;
            bullets[i].z = z;
            bullets[i].angle = angle;
            bullets[i].speed = 20;
            bullets[i].active = TRUE;
            break;
        }
    }
}


U0 UpdateBullets(){
    U8 i;
    for (i = 0; i < 10; i++) {
        if (bullets[i].active) {
            bullets[i].x += bullets[i].speed * Cos(bullets[i].angle);
            bullets[i].y += bullets[i].speed * Sin(bullets[i].angle);

            // Deactivate bullet if it goes offscreen
            if(bullets[i].active) {
                if (bullets[i].x < 0 || bullets[i].x > 640 || bullets[i].y < 0 || bullets[i].y > 480) {
                    bullets[i].active = FALSE;
                    bullets[i].speed = 0;
                }
            }
        }
    }
}