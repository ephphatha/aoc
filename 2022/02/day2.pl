#! /usr/bin/perl

use strict;
use warnings;

use feature qw(say);

sub part1 {
	my $sum = 0;

	my %results = (
		X => {
			score => 1,
			A => 3,
			B => 0,
			C => 6,
		},
		Y => {
			score => 2,
			A => 6,
			B => 3,
			C => 0,
		},
		Z => {
			score => 3,
			A => 0,
			B => 6,
			C => 3,
		},
	);

	for my $line (@_) {
		next unless ($line =~ /([ABC]) ([XYZ])/);

		$sum += $results{$2}{'score'} + $results{$2}{$1};
	}

	return $sum;
}

sub part2 {
	my $sum = 0;

	my %results = (
		A => {
			X => 3 + 0,
			Y => 1 + 3,
			Z => 2 + 6,
		},
		B => {
			X => 1 + 0,
			Y => 2 + 3,
			Z => 3 + 6,
		},
		C => {
			X => 2 + 0,
			Y => 3 + 3,
			Z => 1 + 6,
		},
	);

	for my $line (@_) {
		next unless ($line =~ /([ABC]) ([XYZ])/);

		$sum += $results{$1}{$2};
	}

	return $sum;
}

say part1('A Y',
'B X',
'C Z');

open(my $input, '<', 'input.txt');
say part1(readline($input));

say part2('A Y',
'B X',
'C Z');

seek($input, 0, 0);
say part2(readline($input));
