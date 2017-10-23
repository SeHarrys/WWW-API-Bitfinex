package WWW::API::Bitfinex::Wallet;

use Mojo::Base 'WWW::API::Bitfinex';

sub Margin  { shift->Auth('margin_infos'); }
sub Balance { shift->Auth('balances'); }

sub SetBalances {
    my $self = shift;
    my $json = $self->Auth('balances');
    my $skeel;

    map { $skeel->{$_->{currency}} = $skeel->{$_->{currency}} ? $_->{amount} + $skeel->{$_->{currency}} : $_->{amount} } @{$json};
    
    return $skeel;
}

sub Transfer {
    my $self = shift;
    my $args = shift;

    my $Check = $self->Required($args, qw(amount currency walletfrom walletto));

    return $Check if $Check && $Check->{error};

    return $self->Auth('transfer',$args);
}

sub Withdrawal {
    my $self = shift;
    my $args = shift;

    my $Check = $self->Required($args, qw(withdraw_type walletselected amount address account_number bank_name bank_address bank_city bank_country));

    return $Check if $Check && $Check->{error};

    return $self->Auth('withdraw',$args);
}

1;
