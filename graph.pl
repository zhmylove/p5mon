#!/usr/bin/perl

use strict;
use warnings;
use v5.18;

my ($time, $left, $right) = (time);

################# WARNING ################# 
# It's really shity hack for gnuplot
# Fix TZ by applying delta:
my $TZ = 3600 * 3;
################# WARNING ################# 

$left = $time - $ARGV[0];
$right = $time;

$left -= 10; $right += 10;
$left += $TZ; $right += $TZ;
print <<EOT;
set terminal png size 900,400
set title "$ARGV[1]"
set ylabel "Status"
set xlabel "Date"
set xdata time
set timefmt "%s"
set format x "%d.%m %H:%M"
set key left top
set grid
set yr [-1:2]
set xr [$left:$right]
set obj rect from 0, graph 0.25 to graph 1, 0.5 fc rgb "#FF0000" fill transparent solid 0.15 noborder behind
set obj rect from 0, 0.5 to graph 1, 0.75 fc rgb "#00FF00" fill transparent solid 0.15 noborder behind
plot "status" using 1:2 with linespoints lw 2 lt 6 pt 2 title 'Status'
EOT
