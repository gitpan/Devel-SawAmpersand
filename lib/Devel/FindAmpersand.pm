package Devel::FindAmpersand;

use B::FindAmpersand ();

END {
    B::FindAmpersand::compile()->();
}

1;

__END__

=head1 NAME

Devel::FindAmpersand - Report exactly where Perl sawampersand

=head1 SYNOPSIS

    use Devel::FindAmpersand ();

=head1 DESCRIPTION

Use this module only during development and wait for your script to
finish. It will report where your script gets infected by a
sawampersand operation.

=head1 SEE ALSO

Devel::SawAmpersand, B::FindAmpersand

