#!/usr/bin/perl

$semid=semget(20,undef,0100666);

for(;;) {
    $semval=semctl($semid,0,12,undef);
    print STDOUT "$semval";
    print STDOUT "(+, -) -> ";
    $input=<STDIN>;
    chomp $input;

    if($input eq '+') {
	$optstring=pack("s*",0,1,0100666);
    } elsif($input eq '-') {
	$optstring=pack("s*",0,-1,0100666);
    } else {
	redo;
    }
    semop($semid,$optstring);
}
