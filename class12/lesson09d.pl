#! /usr/bin/perl

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
	    ($input eq 'quit')&&(last);
	    print STDOUT "$input\n";
	}
	close(THAT);
    }
}
