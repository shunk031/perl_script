#!/usr/bin/perl

$SIG{'CLD'}='killzombi';

$file='table.csv';
(-f $file)||(die "file not found");
open(READ,"$file");
while(<READ>) {
    chomp $_;
    @line=split(/,/,$_,2);
    $table{$line[0]}=$line[1];
}
close(READ);
print "Loadded..\n";

$this=pack('SnC4x8',2,5555,127,0,0,1);
socket(SOCKET,2,1,0)||die "error\n";
bind(SOCKET,$this)||die "error\n";
listen(SOCKET,2)||die "error\n";
select(THAT);$|=1;select(STDOUT);

for(;;) {
    accept(THAT,SOCKET);
    unless(fork) {
	for(;;) {
	    $input=<THAT>;
	    chomp $input;
	    ($input eq 'q')&&(last);
	    print THAT "$table{$input}\n";
	}
	close(THAT);
	exit 0;
    }
}

sub killzombi {
    wait;
}
