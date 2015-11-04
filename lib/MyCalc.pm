package MyCalc;
use strict;
use warnings;
 
use base 'Exporter';
our @EXPORT = qw(sum);
 
sub sum {
    return $_[0] + $_[1];
}
 
1;