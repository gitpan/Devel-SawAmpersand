#!/usr/bin/perl
print "1..3\n";
eval { require B; };
if ($@) {
  warn "Compiler B not available, skipping test on this platform\n";
  print "ok 1\nok 2\nok 3\n";
  exit;
} else {
  require B::FindAmpersand;
  print "ok 1\n";
}

"ok 2" =~ /.*/ && print "$&\n";

$SIG{__WARN__} = sub { print "ok 3\n" if $_[0] =~ /Found/};
B::FindAmpersand::compile()->();
