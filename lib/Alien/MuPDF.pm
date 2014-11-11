package Alien::MuPDF;
$Alien::MuPDF::VERSION = '0.001';
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

=pod

=encoding UTF-8

=head1 NAME

Alien::MuPDF - Alien package for the MuPDF PDF rendering library

=head1 VERSION

version 0.001

=head1 Inline support

This module supports L<Inline's with functionality|Inline/"Playing 'with' Others">.

=head1 SEE ALSO

L<MuPDF|http://mupdf.com/>

=head1 AUTHOR

Zakariyya Mughal <zmughal@cpan.org>

=head1 COPYRIGHT AND LICENSE

This software is copyright (c) 2013 by Zakariyya Mughal.

This is free software; you can redistribute it and/or modify it under
the same terms as the Perl 5 programming language system itself.

=cut

__END__
# ABSTRACT: Alien package for the MuPDF PDF rendering library

