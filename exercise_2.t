

 #! perl

use strict;
use warnings;
use diagnostics;

use II::Z2P::Support;
use Test::More;

diag "Array tests";
my @y = ('a', 'b', 'c');
is( scalar @y    , 3   , 'a-way we go...' ); # what happens if the 'scalar' isn't there?
is( $y[1] , 'b' , 'be the code' );
is( $y[2] , 'c' , 'see your way' );

push @y , 'd';
is( $y[-1] , 'd' , 'define what you want' );

my $front = shift @y;
is( $front , 'a' , 'and away we went.');

diag "Hash tests";
my %z = (Perl => 'awesome',
        Goldstar => 'awesome',
        you => 'rock!');
is( $z{Perl} , 'awesome'  , 'Perl is awesome' );
is( $z{Goldstar} , 'awesome' , 'Goldstar is awesome too' );
is( $z{you}  , 'rock!'    , 'you do!' );
is( scalar keys %z  , keys %z  , 'turnabout' );
is( scalar values %z  , values %z  , 'another gimme' );

diag 'undef v "undef"';
### NOTE: the __FILL_ME_IN__ below should be replaced with the appropriate
### test function (e.g., 'is', 'isnt', etc.) in order to make the test pass
my $z = 'undef';
is ( defined($z) , 1 , 'is or isnt $x defined' );

done_testing();
completed_exercise();


