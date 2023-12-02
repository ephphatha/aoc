#! /usr/bin/perl

use strict;
use warnings;

use feature qw(say);

sub part1 {
	my $sum = 0;
	for my $line (@_) {
		my @digits = ($line =~ /(\d)/g);
		$sum += $digits[0].$digits[-1];
	}
	return $sum;
}

sub parseDigit {
	my $digit = shift;
	for ($digit) {
		if (/\d/)  { return $digit; }
		elsif (/one/) { return '1'; }
		elsif (/two/) { return '2'; }
		elsif (/three/) { return '3'; }
		elsif (/four/) { return '4'; }
		elsif (/five/) { return '5'; }
		elsif (/six/) { return '6'; }
		elsif (/seven/) { return '7'; }
		elsif (/eight/) { return '8'; }
		elsif (/nine/) { return '9'; }
		else { return ''; }
	}
}

sub part2 {
	my $sum = 0;
	for my $line (@_) {
		my @digits = ($line =~ /(?=(\d|one|two|three|four|five|six|seven|eight|nine))/g);
		$sum += parseDigit($digits[0]).parseDigit($digits[-1]);
	}
	return $sum;
}

say part1('1abc2',
'pqr3stu8vwx',
'a1b2c3d4e5f',
'treb7uchet');

open(my $input, '<', 'input.txt');
say part1(readline($input));

say part2('two1nine',
'eightwothree',
'abcone2threexyz',
'xtwone3four',
'4nineeightseven2',
'zoneight234',
'7pqrstsixteen'
);

seek($input, 0, 0);
say part2(readline($input));
