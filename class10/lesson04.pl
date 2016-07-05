#!/usr/bin/perl

# lesson02とlesson03を改造
$file="ken_all.csv";
open(WRITE,"> out.txt");
open(READ,"$file");
while(<READ>) {
    chomp($_);
    ($_=~m/東京都/)&&(print WRITE "$_\n");
}
close(READ);
close(WRITE);
