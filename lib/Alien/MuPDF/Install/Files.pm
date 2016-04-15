package Alien::MuPDF::Install::Files;
$Alien::MuPDF::Install::Files::VERSION = '0.004';
# allows other packages to use ExtUtils::Depends like so:
#   use ExtUtils::Depends;
#   my $p = new ExtUtils::Depends MyMod, Alien::MuPDF;
# and their code will have all MuPDF available at C level

use strict;
use warnings;

use Alien::MuPDF qw(Inline);
BEGIN { *Inline = *Alien::MuPDF::Inline }
sub deps { () }

__END__

=pod

=encoding UTF-8

=head1 NAME

Alien::MuPDF::Install::Files

=head1 VERSION

version 0.004

=head1 AUTHOR

Zakariyya Mughal <zmughal@cpan.org>

=head1 COPYRIGHT AND LICENSE

This software is copyright (c) 2013 by Zakariyya Mughal.

This is free software; you can redistribute it and/or modify it under
the same terms as the Perl 5 programming language system itself.

=cut
