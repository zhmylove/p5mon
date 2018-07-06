#!/usr/bin/perl

use strict;
use warnings;
use v5.18;

use IO::Socket::PortState 'check_ports';

my $timeout = 8;
my $host    = "213.21.28.6";

$\="\n";
$,=" ";

################# WARNING ################# 
# It's really shity hack for gnuplot
# Fix TZ by applying delta:
my $TZ = 3600 * 3;
################# WARNING ################# 

print time+$TZ, check_ports($host,$timeout,{tcp=>{80=>{}}})->{tcp}{80}{open};
