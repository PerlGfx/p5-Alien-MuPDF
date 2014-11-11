package Alien::MuPDF;

use strict;
use warnings;

use parent qw(Alien::Base Exporter);
our @EXPORT_OK = qw(Inline);
use File::Spec;

sub Inline {
	return unless $_[-1] eq 'C'; # Inline's error message is good
	my $self = __PACKAGE__->new;
	+{
		LIBS => $self->libs,
		INC => $self->cflags,
		CCFLAGSEX => "-std=c99",
		AUTO_INCLUDE => '#include "fitz.h"',
	};
}

sub cflags {
	my ($self) = @_;
	my $top_include = File::Spec->catfile( $self->dist_dir, qw(include) );
	return "-I$top_include " . $self->SUPER::cflags();
}

1;

__END__
# ABSTRACT: Alien package for the MuPDF PDF rendering library

=head1 Inline support

This module supports L<Inline's with functionality|Inline/"Playing 'with' Others">.

=head1 SEE ALSO

L<MuPDF|http://mupdf.com/>
