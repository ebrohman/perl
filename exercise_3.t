#! perl

use strict;
use warnings;
use diagnostics;

use II::Z2P::Support;
use Test::More;

my $bar = 0;
foreach my $element  ( 1 , 2 , 3 , 4 ) {
  $bar = $bar + $element;
}
is( $bar , 10 , 'sum');

my $baz = 1;
is( $baz++ , 1 , 'post-inc');
is( $baz   , 2 , 'post-post-inc');
is( --$baz , 1 , 'pre-dec');

# NOTE: The code below introduces a new operator -- how should you figure out
# what it does and how it works?

my @count = ( 1 , 2 , 3 );
# reverse count = (3, 2, 1)
my $sum = 0;
OUTER: foreach my $i ( @count ) {
 INNER: foreach my $j( reverse @count ) {
    next OUTER if $j > 2;
    next INNER if $i == 3;
    $sum = $sum + ( $i * $j );
  }
}
is( $sum , 0 , 'sum sum');

my $x;
$x //= '0';
$x ||= 1;
is( $x , 1 , '$x defined-or');

my $y = 0;
$y //= 'one';
$y ||= 2;
is( $y , 2 , '$y defined-or');

done_testing();
completed_exercise();











