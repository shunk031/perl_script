#!/usr/bin/perl

$semid=semget(20,undef,0100666);

for(;;) {
    $optstring=pack("s*",0,0,0100666);
    semop($semid, $optstring);
    print STDOUT "zero and add 1\n";
    $optstring=pack("s*",0,1,0100666);
    semop($semid,$optstring);
    $semval=semctl($semid,0,12,undef);
    print STDOUT "$semval\n";
}
