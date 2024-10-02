#!/usr/bin/perl
use Time::HiRes;
use strict;
use warnings;


sub main{
    print("Hello World, From Perl!\n");
    my $iteration_count = 300;
    my $iterations_for_avg = 50;
    my $start_time = [Time::HiRes::gettimeofday()];
    my @iterator_for_avg = (0..$iterations_for_avg);
    for(@iterator_for_avg){
        calculate_pi_newtons_formula($iteration_count);
    }
    my $time_elapsed = Time::HiRes::tv_interval($start_time);
    my $time_elapsed_in_ms = $time_elapsed * 1000;
    my $result = calculate_pi_newtons_formula($iteration_count);
    print(sprintf(
        "Value of pi calculated with newton's formula: %f\nAvg. Time Taken (in milliseconds): %f\nNumber of iterations: %d",
        $result, $time_elapsed_in_ms,$iteration_count
    ));
}

sub calculate_pi_newtons_formula{
    my $iterations = $_[0];
    my @iterator = (0..$iterations);
    my $summation = 0;
    for(@iterator){
        $summation = $summation + ((-1)**(($_**2 - $_)/2))/(2 * $_ + 1);
    }
    $summation * sqrt(2) * 2;
}


main();