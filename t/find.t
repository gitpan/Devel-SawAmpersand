#!/usr/bin/perl
eval { require B; };
if ($@) {
  print "1..0\n";
  warn "Compiler B not available\n";
  exit;
} else {
  print "1..3\n";
  require B::FindAmpersand;
  print "ok 1\n";
}

"ok 2" =~ /.*/ && print "$&\n";

$SIG{__WARN__} = sub { print "ok 3\n" if $_[0] =~ /Found/};
B::FindAmpersand::compile()->();
