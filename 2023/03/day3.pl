#! /usr/bin/perl

use strict;
use warnings;

use feature qw(say refaliasing);
no warnings "experimental::refaliasing";

sub part1 {
	my $sum = 0;
	my @candidates = ();
	my @symbols = ();

	for my $line (@_) {
		while ($line =~ /(\d+)/g) {
			push(@candidates, {value => $1, range => {min => pos($line) - length($1) - 1, max => pos($line)}});
		}

		while ($line =~ /([^.\d\n])/g) {
			push(@symbols, {value => pos($line) - length($1)});
		}

		for \my %symbol (@symbols) {
			for \my %candidate (@candidates) {
				next unless ($candidate{range}{min} <= $symbol{value}
					&& $symbol{value} <= $candidate{range}{max});

				$sum += $candidate{value};
				$candidate{used} = 1;
			}
			@candidates = grep { !$_->{used} } @candidates;
		}

		@candidates = grep { !$_->{stale} } @candidates;

		@symbols = grep { !$_->{stale} } @symbols;

		for \my %candidate (@candidates) {
			$candidate{stale} = 1;
		}

		for \my %symbol (@symbols) {
			$symbol{stale} = 1;
		}
	}
	return $sum;
}

sub part2 {
	my $sum = 0;
	my @candidates = ();
	my @gears = ();

	while (my ($index, $line) = each @_) {
		while ($line =~ /(\d+)/g) {
			push(@candidates, {value => $1, line => $index, range => {min => pos($line) - length($1) - 1, max => pos($line)}});
		}

		while ($line =~ /([*])/g) {
			push(@gears, {position => {x => pos($line) - length($1), y => $index}});
		}

		for \my %gear (@gears) {
			for \my %candidate (@candidates) {
				next if ($candidate{connections}{$gear{position}{x}.",".$gear{position}{y}});

				next unless ($gear{position}{y} + 1 >= $candidate{line}
					&& $candidate{range}{min} <= $gear{position}{x}
					&& $gear{position}{x} <= $candidate{range}{max});

				push(@{$gear{ratios}}, $candidate{value});
				$candidate{connections}{$gear{position}{x}.",".$gear{position}{y}} = 1;
			}
		}

		@candidates = grep { $_->{line} >= $index } @candidates;
	}

	for \my %gear (@gears) {
		$sum += $gear{ratios}[0] * $gear{ratios}[1] if (scalar @{$gear{ratios}} == 2);
	}
	return $sum;
}

say part1('467..114..',
'...*......',
'..35..633.',
'......#...',
'617*......',
'.....+.58.',
'..592.....',
'......755.',
'...$.*....',
'.664.598..');

open(my $input, '<', 'input.txt');
say part1(readline($input));

say part2('467..114..',
'...*......',
'..35..633.',
'......#...',
'617*......',
'.....+.58.',
'..592.....',
'......755.',
'...$.*....',
'.664.598..');

seek($input, 0, 0);
say part2(readline($input));
