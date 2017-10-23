#!perl -T
use 5.006;
use strict;
use warnings FATAL => 'all';

use Test::More;
use Test::Mojo;

use WWW::API::Bitfinex;

plan tests => 4;

my $B = WWW::API::Bitfinex->new;

is($B->apikey,undef,'Null API Key');
is($B->apipass,undef,'Null API Pass');

$B = WWW::API::Bitfinex->new( apikey => 'APIKEY' , apipass => 'APIPASS' );

is($B->apikey ,'APIKEY' ,'API Key');
is($B->apipass,'APIPASS','API Pass');

done_testing();
