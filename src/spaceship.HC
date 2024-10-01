I16 x = 250;
I16 y = 250;
U8 z = 0; // Always 0 so you get the least possible amount of memory.
F64 angle = 0;

F64 speed = 0.0;

U0 updateSpaceship() {

    I16 newX, newY;

    newX = x + speed * Cos(angle);
    newY = y + speed * Sin(angle);

    if(newX > 0 && newX < 640){
        x = newX;
    }
    if(newY > 0 && newY < 480){
        y = newY;
    }

    if(speed > 0){
        speed -= 0.1;
    }
    else if(speed < 0){
        speed += 0.1;
    }
}