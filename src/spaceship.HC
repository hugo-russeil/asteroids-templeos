I16 x = 250;
I16 y = 250;
U8 z = 0; // Always 0 so you get the least possible amount of memory.
F64 angle = 0;

F64 speed = 0.0;

U0 updateSpaceship() {
    x += speed * Cos(angle);
    y += speed * Sin(angle);

    if(speed > 0){
        speed -= 0.1;
    }
    else if(speed < 0){
        speed += 0.1;
    }
}