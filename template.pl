#! /usr/bin/perl

use strict;
use warnings;

use feature qw(say);

sub part1 {
}

sub part2 {
}

say part1();

open(my $input, '<', 'input.txt');
say part1(readline($input));

say part2();

seek($input, 0, 0);
say part2(readline($input));
