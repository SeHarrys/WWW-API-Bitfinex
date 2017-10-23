package WWW::API::Bitfinex::Margin;

use Mojo::Base 'WWW::API::Bitfinex';

sub New {
    my $self = shift;
    my $args = shift;

    my $Check = $self->Required($args, qw(currency amount));

    return $Check if $Check && $Check->{error};

    return $self->Auth('offer/new',$args);
}

sub Cancel {
    my $self = shift;
    my $args = shift;

    my $Check = $self->Required($args, qw(offer_id));

    return $Check if $Check && $Check->{error};

    return $self->Auth('offer/cancel');
}

sub Status {
    my $self = shift;
    my $args = shift;

    my $Check = $self->Required($args, qw(offer_id));

    return $Check if $Check && $Check->{error};

    return $self->Auth('offer/status',$args);
}

sub Credits { return shift->Auth('credits'); }
sub Offers  { return shift->Auth('offers');  }

=doc Params
 limit : limit number of results
=cut
sub OffersHistory {
    my $self = shift;
    my $args = shift;

    return $self->Auth('offer/status',$args);
}

1;
