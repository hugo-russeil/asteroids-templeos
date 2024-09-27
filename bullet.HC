#include "./spaceship.HC"

class Bullet{
    I32 x;
    I32 y;
    I32 z;
    F64 angle;
    F64 speed;
};

Bullet bullets[100];
I32 bullet_count = 0;

U0 ShootBullet() {
    if (bullet_count < 100){
        bullets[bullet_count].x = x;
        bullets[bullet_count].y = y;
        bullets[bullet_count].z = z;
        bullets[bullet_count].angle = angle;
        bullets[bullet_count].speed = 20;
        bullet_count++;
    }
}


U0 UpdateBullets(){
    I32 i;
    for (i = 0; i < bullet_count; i++){
        bullets[i].x += bullets[i].speed * Cos(bullets[i].angle);
        bullets[i].y += bullets[i].speed * Sin(bullets[i].angle);
    }
}