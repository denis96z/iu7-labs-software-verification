byte state = 1;

active proctype F1() {
x:  (state == 1) -> state = 2; printf("state = %d\n", state)
    (state == 3) -> state = 1; printf("state = %d\n", state)
goto x
}

active proctype F2() {
    (state == 2) -> state = 3; printf("state = %d\n", state)
}
