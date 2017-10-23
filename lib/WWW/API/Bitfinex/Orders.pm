package WWW::API::Bitfinex::Orders;

use Mojo::Base 'WWW::API::Bitfinex';

=doc
 type = market 
=cut
sub New{
    my $self = shift;
    my $struct = shift;

    return $self->Auth('order/new',$struct)
}

sub Active  { shift->Auth('orders'); }
sub History { shift->Auth('orders/hist'); }

sub Status {
    my $self = shift;
    my $args = shift;

    my $Check = $self->Required($args, qw(order_id));

    return $Check if $Check && $Check->{error};
    
    return $self->Auth('order/status',$args);
}

=doc

=cut
sub Cancel {
    my $self = shift;
    my $args = shift;

    my $Check = $self->Required($args, qw(order_id));
    
    return $Check if $Check && $Check->{error};
    
    return $self->Auth('order/cancel',$args);
}

sub CancelAll { shift->Auth('order/cancel/all'); }

1;
