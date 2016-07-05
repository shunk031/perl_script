#!/usr/bin/perl

$semid=semget(20,undef,0100666);
semctl($semid,undef,0,undef);
