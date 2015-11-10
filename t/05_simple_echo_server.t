use strict;
use warnings;
 
my $pid = fork();
die 'Could not fork' if not defined $pid;
 
if (not $pid) {
    close STDERR;
    exec("$^X bin/simple_echo_server.pl");
}
 
END {
  if ($pid) {
    kill 2, $pid;
    wait;
  }
}
 
sleep 1;
require Test::More;
import Test::More;
require Net::Telnet;
plan(tests => 7);
my $t = Net::Telnet->new();
ok($t->open(Host => 'localhost', Port => 8000, Timeout => 10), 'connected');
 
{
    my ($pre, $match) = $t->waitfor('/(?<=if you want to leave)/');
    is($pre, "Welcome to the Echo server, please type in some text and press enter. Say 'bye' if you want to leave", 'banner');
    is($match, '', 'empty');
}
 
{
    $t->print('hello');
    my ($pre, $match) = $t->waitfor('/You said "hello"/');
    like($pre, qr/^\s*$/, 'just newline');
    is($match, 'You said "hello"', 'reply by the server');
}
{
    $t->print('bye');
    my ($pre, $match) = $t->waitfor('/You said "bye"/');
    like($pre, qr/^\s*$/, 'just newline');
    is($match, 'You said "bye"', 'reply by the server');
}