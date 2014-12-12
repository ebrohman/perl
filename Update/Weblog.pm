package Update::Weblog;
use Moose;
extends 'Update';

has 'blog_name' => ( is => 'ro' , isa => 'Str' , required => 1 );
has 'blog_url'  => ( is => 'ro' , isa => 'Str' , required => 1 );

sub comment {
  my( $self , %args ) = @_;
  die unless $args{content};
  1;
}

sub share {}



1;
