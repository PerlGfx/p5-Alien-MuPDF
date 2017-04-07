package Alien::MuPDF;

use strict;
use warnings;

use parent qw(Alien::Base);
use File::Spec;

=method mutool_path

Returns a C<Str> which contains the absolute path
to the C<mutool> binary.

=cut
sub mutool_path {
  my ($self) = @_;
  File::Spec->catfile( File::Spec->rel2abs($self->dist_dir) , 'bin', 'mutool' );
}

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

sub libs {
	# third party
	"-lcrypto";
}

sub Inline {
	my ($self, $lang) = @_;

	if('C') {
		my $params = Alien::Base::Inline(@_);
		$params->{MYEXTLIB} .= ' ' .
			join( " ",
				map { File::Spec->catfile(
					File::Spec->rel2abs(Alien::MuPDF->dist_dir),
					'lib',  $_ ) }
				qw(libmupdf.a libmupdfthird.a)
			);

		return $params;
	}
}

1;

__END__
# ABSTRACT: Alien package for the MuPDF PDF rendering library

=head1 Inline support

This module supports L<Inline's with functionality|Inline/"Playing 'with' Others">.

=head1 SEE ALSO

L<MuPDF|http://mupdf.com/>
