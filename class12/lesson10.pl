#!/usr/bin/perl

$that=pack('SnC4x8',2,5555,127,0,0,1);
socket(SOCKET,2,1,0) || die "error\n";
connect(SOCKET,$that) || die "error\n";
select(SOCKET);$|=1;select(STDOUT);

for (;;) {
    print STDOUT 'input zip-code (q:quit) -> ';
    $input=<STDIN>;
    chomp $input;
    ($input eq '')&&(next);
    print SOCKET "$input\n";
    ($input eq 'q')&&(&quit);
    $output=<SOCKET>;
    chomp $output;
    print STDOUT "$output\n";
}

sub quit {
    close(SOCKET);
    exit 0;
}
