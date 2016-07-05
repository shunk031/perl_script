#!/usr/bin/perl

$SIG{ 'CLD' }='killzombi';
$SIG{ 'INT' }='sighello';
$SIG{ 'KILL' }='sighello';

$file="table.csv";
open(READ,"$file");
for(;;) {
    print '->';
    $input=<STDIN>;
    chomp $input;
    seek(READ,0,0);
    unless(fork) {
	while(<READ>) {
	    chomp $_;
	    ($input eq '')||($_=~/$input/)&&(print "$_\n");
	}
	exit 0;
    }
}
close(READ);

sub killzombi {
    wait;
}

sub sighello {
    print "hello\n";
}
