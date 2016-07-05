#!/usr/bin/perl

$that=pack('SnC4x8',2,5555,127,0,0,1);
socket(SOCKET,2,1,0)||die "error\n";
connect(SOCKET,$that)||die "error\n";
select(SOCKET);$|=1;select(STDOUT);

for(;;) {
    print STDOUT '-> ';
    $input=<STDIN>;
    chomp $input;
    print SOCKET "$input\n";
    ($input eq 'quit')&&(&quit);
}

sub quit {
    close(SOCKET);
    exit 0;
}
