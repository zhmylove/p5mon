#!/bin/sh -e

cd /etc/p5mon/
./graph.pl 3600 Hour     | gnuplot-nox > status-Hour.png
./graph.pl 86400 Day     | gnuplot-nox > status-Day.png
./graph.pl 2678400 Month | gnuplot-nox > status-Month.png
