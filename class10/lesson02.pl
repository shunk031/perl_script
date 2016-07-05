#!/usr/bin/perl

$file='ken_all.csv';
open(READ,"$file");
while(<READ>) {
    chomp($_);
    print "$_\n";
}

close(READ);
