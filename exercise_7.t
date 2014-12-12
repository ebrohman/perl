#! perl

use strict;
use warnings;
use diagnostics;

use II::Z2P::Support;
use Test::More;
use Test::Exception;
use utf8

#### PROBLEM ONE ####
# this exercise is going to make use of a test files:
# * /usr/share/dict/words is a list of ~99,000 words, one word per line

## IMPORTANT NOTE: The above files may contain unicode characters. You should
## modify this test script accordingly.

# step one: open up /usr/share/dict/words and loop over all the lines

# step two: modify the loop so that you check to see if the word on the
# current line contains 4 or more _CONSECUTIVE_ vowel characters
# (vowels = AEIOU)

# step three: if the word does have 4 or more vowels, save it into @quadvowels
open( my $FH, '<', '/usr/share/dict/words') or die $!;
while (<$FH> =~ /*[aeiou]{4,}*/) { push my @quadvowels, $1 }
is(@quadvowels , 36 , 'expected number of quadvowels');

# step four: write a test using the like() function from Test::More that
# validates that the elements of @quadvowels have the expected number of vowels.
__FIXME__;

#### PROBLEM TWO ####
# parse /usr/share/dict/words again and extract the words that contain all
# five vowels _in_order_. save those into @ordered_vowels



is(@ordered_vowels, 7, 'expected number of ordered vowels');


#### PROBLEM THREE ####
# ex_7_input.txt is a log file from an apache server
# use regular expressions to parse this log file and extract:
# a) the overall number of web requests in this log
# b) the number of _unique_ IP addresses
# c) the number of _unique_ pages requested (n.b., CGI params are not part of a page!)

is( $hits , 27076 , 'expected number of hits' );

is( $unique_ips , 2915 , 'expected number of unique IPs' );

is( $unique_pages , 434 , 'expected number of unique pages' );

# here's a break down of the fields in the log format:
#
# 12.236.138.9 - - [14/Oct/2003:14:56:52 -0400] "GET /blogtool/item.cgi?id=1066102527 ...
# ^                ^                             ^   ^                 ^
# IP Address       Date                          |   URL requested     CGI params (? delim)
#                                                HTTP method

done_testing();
completed_exercise();



