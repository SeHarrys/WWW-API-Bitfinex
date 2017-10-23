package WWW::API::Bitfinex::Positions;

use Mojo::Base 'WWW::API::Bitfinex';

sub Active {
    my $self = shift;

    return $self->Auth('positions');
}

sub Claim {
    my $self = shift;
    my $args = shift;

    return { error => 'Required: Position ID' } unless $args->{position_id};
    return { error => 'Required: Amount' } unless $args->{amoun};
    
    return $self->Auth('position/claim',$args);
}

1;
