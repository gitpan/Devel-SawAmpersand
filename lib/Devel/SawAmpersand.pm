package Devel::SawAmpersand;

use strict;
use vars qw($VERSION @ISA @EXPORT_OK);

use Exporter;
*import = \&Exporter::import;
require DynaLoader;
@ISA = qw(DynaLoader);
@EXPORT_OK = qw(sawampersand);
$VERSION = '0.30';

bootstrap Devel::SawAmpersand $VERSION;

1;

__END__

=head1 NAME

Devel::SawAmpersand - Perl extension querying sawampersand variable

=head1 SYNOPSIS

  use Devel::SawAmpersand qw(sawampersand);

  sawampersand();

=head1 DESCRIPTION

There's a global variable in the perl source, called sawampersand. It
gets set to true in that moment in which the parser sees one of $`,
$', and $&. It never can be set to false again. Trying to set it to
false breaks the handling of the $`, $&, and $' completely.

If the global variable C<sawampersand> is set to true, all subsequent
RE operations will be accompanied by massive in-memory copying,
because there is nobody in the perl source who could predict, B<when>
the (necessary) copy for the ampersand family will be needed. So B<all>
subsequent REs are considerable slower than necessary.

There are at least three impacts for developers:

=over 4

=item *

never use $& and friends in a library.

=item *

Don't "use English" in a library, because it contains the three bad
fellows. Corollary: if you really want to use English, do it like so:

    use English qw( -no_match_vars ) ;

=item *

before you release a module or program, check
if sawampersand is set by any of the modules you use or require.

=back

=head2 Workaround

Fortunately perl offers easy to use alternatives, that is

       instead of this              you can use this

     $`   of   /pattern/          $1   of  /(.*?)pattern/s
     $&   of   /pattern/          $1   of  /(pattern)/
     $'   of   /pattern/          $+   of  /pattern(.*)/s

In general, apply C</^(.*)(pattern)(.*)$/s> and use $1 for $`, $2 for
$& and $+ for $' ($+ is not dependent on the number of parens in the
original pattern). Note that the C</s> switch can alter the meaning of
C<.> in your pattern.

=head2 Future Directions

  From: jmm@elegant.com (John Macdonald)
  Date: Wed, 24 Dec 1997 10:49:56 -0500

How about adding an option to matches/substitutes that
explicitly sets $`, $&, and $'?  When this new option is seen,
sawampersand will be set for the duration of the match and then
turned off.  That causes the expense for unflagged matches to go
back to normal and only flagged matches incur the extra expense
and they would be the ones that actually need it.  (Or does
sawampersand need to affect the compilation of the RE's too?)

=head1 AUTHOR

Andreas Koenig, special thanks to Johan Vromans and John Macdonald for
parts of the manpage and to Doug MacEachern for the FindAmpersand.

=head1 SEE ALSO

Devel::FindAmpersand, B::FindAmpersand

=cut
