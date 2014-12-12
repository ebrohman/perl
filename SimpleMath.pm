package SimpleMath;
use strict;
use warnings;
use Exporter 'import';
our @EXPORT_OK = qw/add mult/;

sub add {
  my @args = @_ ;
  die 'add requires args' unless @args;
  die 'multiple args not present' unless @args > 1;
  my $sum = 0;
  $sum += $_ foreach (@args);
  return $sum;
}

sub mult {
  my @args = @_ ;
  die 'mult requires args' unless @args;
  die 'multi requires two or more args' unless @args > 1;
  my $total = 1;
  $total *= $_ foreach (@args);
  return $total;

}

1;










































