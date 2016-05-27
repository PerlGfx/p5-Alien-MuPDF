package Alien::MuPDF;

use strict;
use warnings;

use parent qw(Alien::Base);
use File::Spec;

sub inline_auto_include {
	return  [ 'mupdf/fitz.h' ];
}

sub cflags {
	my ($self) = @_;
	my $top_include = File::Spec->catfile( $self->dist_dir, qw(include) );
	# We do not include $self->SUPER::cflags() because that adds too many
	# header files to the path. In particular, it adds -Imupdf/fitz, which
	# leads to "mupdf/fitz/math.h" being included when trying to include
	# the C standard "math.h" header.
	return "-I$top_include";
}

1;

__END__
# ABSTRACT: Alien package for the MuPDF PDF rendering library

=head1 Inline support

This module supports L<Inline's with functionality|Inline/"Playing 'with' Others">.

=head1 SEE ALSO

L<MuPDF|http://mupdf.com/>
