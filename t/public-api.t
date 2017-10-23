#!perl -T
use strict;
use warnings FATAL => 'all';

use Test::More;
use Test::Mojo;

use WWW::API::Bitfinex;
use Data::Dumper;

plan tests => 15;

my $B = WWW::API::Bitfinex->new;

my $Symbols = $B->SymbolsDetail;

isnt($Symbols,undef,'SymbolsDetail');

my $Sym = $Symbols->[0];

for (qw(minimum_order_size maximum_order_size price_precision minimum_margin pair initial_margin expiration)) {
    ok( exists $Sym->{$_}, "SymbolsDetail -> $_");
}    

my $Trades = $B->Trades('MYCOIN');

is($Trades->{message},'Unknown symbol','Trades: Unknown symbol');

$Trades = $B->Trades('LTCUSD');

my $Trade = $Trades->[0];

for (qw(timestamp amount type price exchange tid)) {
    ok( exists $Trade->{$_}, "Trades -> $_");
}

done_testing();
