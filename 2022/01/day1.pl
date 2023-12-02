#! /usr/bin/perl

use strict;
use warnings;

use feature qw(say);

sub part1 {
	my $max = 0;
	my $sum = 0;

	for my $line (@_) {
		if ($line =~ /(\d+)/) {
			$sum += $1;
		} else {
			$max = $sum if ($sum > $max);
			$sum = 0;
		}
	}

	$max = $sum if ($sum > $max);
	return $max;
}

sub getTop3 {
	my @sorted = sort { $b <=> $a } @_;
	return grep(defined, @sorted[0..2]);
}

sub part2 {
	my @totals = ();
	my $sum = 0;

	for my $line (@_) {
		if ($line =~ /(\d+)/) {
			$sum += $1;
		} else {
			@totals = getTop3(@totals, $sum);
			$sum = 0;
		}
	}

	@totals = getTop3(@totals, $sum);
	$sum = 0;
	for (@totals) {
		$sum += $_;
	}
	return $sum;
}

say part1('1000',
'2000',
'3000',
'',
'4000',
'',
'5000',
'6000',
'',
'7000',
'8000',
'9000',
'',
'10000');

open(my $input, '<', 'input.txt');
say part1(readline($input));

say part2('1000',
'2000',
'3000',
'',
'4000',
'',
'5000',
'6000',
'',
'7000',
'8000',
'9000',
'',
'10000');

seek($input, 0, 0);
say part2(readline($input));
