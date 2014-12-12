#! perl

use strict;
use warnings;
use diagnostics;

use II::Z2P::Support;
use Test::More;
use Test::Exception;

# let's implement the example that lead us to references:
# a function that takes two arrays and returns a hash where the
# keys come from the first array and the values come from the second

sub hasher {
  my( $a, $b) = @_;
  die "len(one) != len(two)"
    unless @$a == @$b;
  my %return;
  foreach (my $i = 0; $i <  @$a ; $i++){
    $return{ $a -> [$i] } = $b -> [$i];
  }
  return %return;
}

my %hash = hasher( [ 1 , 2 , 3 ] , [ 4 , 5 , 6 ]);
is_deeply(  \%hash , { 1 => 4 , 2 => 5 , 3 => 6 } , 'hashed!');

# note our new 'use' statement above. how would you find out what dies_ok does?
dies_ok { hasher( [1 , 2 , 3 ] , [ 1 , 2 ] ) } 'len(first) != len(second)';

# # bonus problem -- uncomment this block to try this.
 {
   use Test::Warn;
   # guess how to find out what 'warning_is' does. 8^)
   warning_is { hasher( [ 1 , 1 , 2 ] , [ 1 , 2 , 3 ]) } "Duplicate values in key array" ,
     "Duplicate values in first array cause warning";
 }

done_testing();
completed_exercise();



















