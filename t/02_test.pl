use strict;
use warnings;
 
use FindBin qw($Bin);
use lib "$Bin/lib";
use MyCalc;
 
 
print sum(1, 1),    " 2\n";
print sum(2, 2),    " 4\n";
print sum(2, 2, 2), " 6\n";

if (sum(1, 1) ==  2) {
    print "ok\n";
} else {
    print "not ok\n";
}
 
if (sum(2, 2) == 4) {
    print "ok\n";
} else {
    print "not ok\n";
}
 
if (sum(2, 2, 2) == 6) {
    print "ok\n";
} else {
    print "not ok\n";
}


ok(sum(1, 1) ==  2);
ok(sum(2, 2) == 4);
ok(sum(2, 2, 2) == 6);
 
 
sub ok {
    my ($true) = @_;
    if ($true) {
        print "ok\n";
    } else {
        print "not ok\n";
    }
}

use Test::Simple tests => 3;
 
ok(sum(1, 1) ==  2);
ok(sum(2, 2) == 4);
ok(sum(2, 2, 2) == 6);