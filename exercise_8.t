#! perl

use strict;
use warnings;
use diagnostics;

use II::Z2P::Support;
use Test::More;
use Test::Exception;

# for this exercise, you're going to write a module called SimpleMath.
# SimpleMath should export two functions, add() and mult().

BEGIN { use_ok( 'SimpleMath' , qw/ add mult / ) }
ok( main->can('add')  , 'add() exported' );
ok( main->can('mult') , 'mult() exported' );

# the rest of the tests in this file define the interfaces
# for the add() and mult() functions.

dies_ok { add()  } 'add requires args';
dies_ok { mult() } 'mult requires args';

dies_ok { add(1)  } 'add requires >1 arg';
dies_ok { mult(1) } 'mult requries >1 arg';

is( add(  1 , 1 ) , 2 , '1 + 1' );
is( mult( 1 , 1 ) , 1 , '1 * 1' );

is( add(  2 , 2 , 2 ) , 6 , '2 + 2 + 2' );
is( mult( 2 , 2 , 2 ) , 8 , '2 * 2 * 2' );

done_testing();
completed_exercise();

















