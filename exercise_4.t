#! perl

use strict;
use warnings;
use diagnostics;

use II::Z2P::Support;
use Test::More;

diag "write your first subroutine";
sub my_first_sub {
  return 'yes it is';
}
is( my_first_sub() , 'yes it is' , 'make it work!' );

diag "a sub that gets passed an argument";
sub call_me {
  my( $arg ) = @_;
  if ( $arg eq 'maybe' ) { return 'oh baby' }
  else { return 'this is crazy' }
}
is( call_me( 'maybe') , 'oh baby' , 'sorry about the earworm' );

diag "more fill in the blank...";
sub pass_me {
  my $arg = shift;
  if ( $arg eq 1 ) { return 'its one!' }
  else { return 'unexpected value passed' }
}
is( pass_me(1) , 'its one!' , 'all up to you' );

diag "all you...";
sub now_you_do_one {
  my ($arg) = @_;
  return ($arg * 2);
}
is( now_you_do_one( 2 ) , 4 , 'times two, dummy' );

sub successor {
  my $num = shift;
  return $num + 1;
}
is(successor(3), 4);
is(successor(41), 42);

diag "shadowing";
my($foo , $bar , $baz );
{
  my $bar = 10;
  is( $bar , 10 , 'gimme' );
  $bar *= $bar;
  $foo = $bar;
}
is( $bar , undef , 'bar?' );
is( $foo , 100 , 'foo?' );
is( $baz , undef , 'baz?' );

done_testing();
completed_exercise();



