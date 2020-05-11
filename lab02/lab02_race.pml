byte counter = 0;

active proctype F1() {
    do:: (counter < 50) ->
        printf("proc=%d, counter=%d\n", _pid, counter);
        counter = counter + 1;
        printf("proc=%d, counter=%d\n", _pid, counter);
    od
}

active proctype F2() {
    do:: (counter < 50) ->
        printf("proc=%d, counter=%d\n", _pid, counter);
        counter = counter + 10;
        printf("proc=%d, counter=%d\n", _pid, counter);
    od
}
