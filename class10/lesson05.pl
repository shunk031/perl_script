#!/usr/bin/perl

$file="ken_all.csv";
$save="table.csv";

open(WRITE," > $save");
open(READ,"$file");
while(<READ>){
    chomp($_);
    $_=~s/\"//g;
    @line=split(/,/,$_);
    $line[3]=~s/以下に掲載がない場合//;
    $out=$line[0].','.$line[1].$line[2].$line[3];
    print WRITE "$out\n";
}

close(READ);
close(WRITE);
