byte counter = 0;

chan lock = [0] of {byte}

active proctype F1() {
    do:: (counter < 50) ->
        lock?1 -> counter = counter + 1
        printf("proc=%d, counter=%d\n", _pid, counter)
        lock!2
    od
}

active proctype F2() {
    do:: (counter < 50) ->
        lock?2 -> counter = counter + 10
        printf("proc=%d, counter=%d\n", _pid, counter)
        lock!1
    od
}

active proctype main() {
    lock!1
}
