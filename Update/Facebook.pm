package Update::Facebook;
use Moose;
extends 'Update';

sub like {}

sub comment {
  my( $self , %args ) = @_;
  die unless $args{body};
  1;
}

sub share { return shift }

1;
