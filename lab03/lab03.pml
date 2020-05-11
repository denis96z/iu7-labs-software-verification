mtype = {
    PID,
    NUM
}

int r = 0
byte n = 0

chan request = [0] of {byte};

active proctype client() {
loop:
    (n % 2 == 0); request!PID
    printf("request=PID | response: %d\n", r)

    (n % 2 == 1); request!NUM
    printf("request=NUM | response: %d\n", r)

if :: (n < 10) ->
    goto loop
fi
}

active proctype server() {
    byte x = 0
    byte p = _pid

loop:
    if :: request?PID -> r = p
       :: request?NUM -> r = x
    fi

    n = n + 1
    x = x + n

    goto loop
}
