print "1..3\n";

use B::FindAmpersand ();

print "ok 1\n";

"ok 2" =~ /.*/ && print "$&\n";

$SIG{__WARN__} = sub { print "ok 3\n" if $_[0] =~ /Found/};
B::FindAmpersand::compile()->();
