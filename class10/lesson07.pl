#!/usr/bin/perl

$file='table.csv';
open(READ,"$file");
for(;;){
    print "->";
    $input=<STDIN>;
    chomp $input;
    seek(READ,0,0);
    while(<READ>) {
	chomp $_;
	($_=~m/$input/)&&(print "$_\n");
    }
}
close(READ)
