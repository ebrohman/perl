#! perl

use strict;
use warnings;
use diagnostics;

use utf8;
use warnings ('FATAL' , 'utf8');
use open (':std',':utf8');

use II::Z2P::Support;
use Test::More;
use Test::Exception;

# this exercise is going to make use of a few test files:
# * ex_6_input.txt
# * ex_6_output_1.txt
# * ex_6_output_2.txt

## IMPORTANT NOTE: The above files may contain unicode characters. You should
## modify this test script accordingly.

## NOTE: Some of the __FIXME__ and __FILL_ME_IN__ placeholders below need to
## be replaced by more than one line of code.

# first, read ex_6_input.txt into @first_input
# skip any lines that are just white space -- i.e., skip any blank lines.
open( my $in1 , '<' , './ex_6_input.txt' ) or die $!;
my @first_input;
while ( <$in1> ){
  chomp;
  push @first_input , "$_\n"
    if $_;
}
close($in1);

# next, read in ex_6_output_1.txt into @first_output
open( my $in2 , '<' , './ex_6_output_1.txt' ) or die $!;
my @first_output = <$in2>;

is_deeply( \@first_input , \@first_output , 'in and out match' );

# next, read ex_6_input.txt in and create @second_input -- an array with two
# copies of each line of ex_6_input.txt. that is, if first line of file is
# 'foo', first element of @second_input should be 'foofoo'
open( my $in3 , '<' , './ex_6_input.txt' ) or die $!;
my @second_input;
while ( <$in3> ){
  chomp;
  push @second_input , "$_$_\n";
}
close($in3);

# finally, read in ex_6_output_2.txt into @second_output
open( my $in4 , '<' , './ex_6_output_2.txt' ) or die $!;
my @second_output = <$in4>;

is_deeply( \@second_input , \@second_output );

done_testing();
completed_exercise();






