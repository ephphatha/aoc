#! /usr/bin/perl

use strict;
use warnings;

use feature qw(say);

sub part1 {
	my $sum = 0;
	LINE: for my $line (@_) {
		next unless $line =~ /Game (\d+):(.*)/;
		my $id = $1;
		my @sets = split(';', $2);
		for (@sets) {
			next LINE if (/(\d+) red/ and $1 > 12);
			next LINE if (/(\d+) green/ and $1 > 13);
			next LINE if (/(\d+) blue/ and $1 > 14);
		}
		$sum += $id;
	}
	return $sum;
}

sub part2 {
	my $sum = 0;
	for my $line (@_) {
		next unless $line =~ /Game (\d+):(.*)/;
		my $id = $1;
		my @sets = split(';', $2);
		my ($red, $green, $blue) = (0, 0, 0);
		for (@sets) {
			$red = $1 if (/(\d+) red/ and $1 > $red);
			$green = $1 if (/(\d+) green/ and $1 > $green);
			$blue = $1 if (/(\d+) blue/ and $1 > $blue);
		}
		$sum += $red * $green * $blue;
	}
	return $sum;
}

say part1('Game 1: 3 blue, 4 red; 1 red, 2 green, 6 blue; 2 green',
'Game 2: 1 blue, 2 green; 3 green, 4 blue, 1 red; 1 green, 1 blue',
'Game 3: 8 green, 6 blue, 20 red; 5 blue, 4 red, 13 green; 5 green, 1 red',
'Game 4: 1 green, 3 red, 6 blue; 3 green, 6 red; 3 green, 15 blue, 14 red',
'Game 5: 6 red, 1 blue, 3 green; 2 blue, 1 red, 2 green');

open(my $input, '<', 'input.txt');
say part1(readline($input));

say part2('Game 1: 3 blue, 4 red; 1 red, 2 green, 6 blue; 2 green',
'Game 2: 1 blue, 2 green; 3 green, 4 blue, 1 red; 1 green, 1 blue',
'Game 3: 8 green, 6 blue, 20 red; 5 blue, 4 red, 13 green; 5 green, 1 red',
'Game 4: 1 green, 3 red, 6 blue; 3 green, 6 red; 3 green, 15 blue, 14 red',
'Game 5: 6 red, 1 blue, 3 green; 2 blue, 1 red, 2 green');

seek($input, 0, 0);
say part2(readline($input));
