package Alien::MuPDF::Install::Files;

# allows other packages to use ExtUtils::Depends like so:
#   use ExtUtils::Depends;
#   my $p = new ExtUtils::Depends MyMod, Alien::MuPDF;
# and their code will have all MuPDF available at C level

use strict;
use warnings;

use Alien::MuPDF qw(Inline);
BEGIN { *Inline = *Alien::MuPDF::Inline }
sub deps { () }
