#!perl -T
use 5.006;
use strict;
use warnings FATAL => 'all';

use Test::More;
use Test::Mojo;

unless ( $ENV{BITFINEX_APIKEY} && $ENV{BITFINEX_APIPASS} ) {
    plan( skip_all => "Need Bitfinex APIKEY && APIPASS" );
}

plan tests => 0;


done_testing();
