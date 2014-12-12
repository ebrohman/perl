package Update::Twitter;
use Moose;
extends 'Update';

sub retweet {
  my $self = shift;

  return $self->new(
    author    => $self->author ,
    timestamp => $self->timestamp ,
    content   => "RT: " . $self->content ,
  );
}
sub reply {
  my( $self, %args ) = @_;

  die 'blah' unless $args{body};

  return $self->new(
    author    => $self->author ,
    timestamp => $self->timestamp ,
    content   => $args{body} ,
  );
}

1;
