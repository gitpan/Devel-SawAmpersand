package Devel::SawAmpersand;

use strict;
use vars qw($VERSION @ISA @EXPORT_OK);

use Exporter;
*import = \&Exporter::import;
require DynaLoader;
@ISA = qw(DynaLoader);
@EXPORT_OK = qw(sawampersand);
$VERSION = '0.01';

bootstrap Devel::SawAmpersand $VERSION;

1;

__END__

=head1 NAME

Devel::SawAmpersand - Perl extension querying and setting sawampersand

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
subsequent REs are considerable slower than necessary. So first lesson
to learn: never use $& and friends in a library. Second lesson to
learn: Never "use English" in a library, because it contains the three
bad fellows.

Third lesson to learn: before you release a module or program, check
if sawampersand is set by any of the modules you use or require.

=head1 AUTHOR

Andreas Koenig

=head1 SEE ALSO

perl(1).

=cut
