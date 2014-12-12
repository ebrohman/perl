package Update;
use Moose;
has author => ( is => 'ro' , isa => 'Str' , required => 1 );
has timestamp =>  ( is => 'ro' , isa => 'Str' , required => 1 );
has content  =>  ( is => 'ro' , isa => 'Str' , required => 1 );

1;
