use Test::More tests => 2;

use strict;
use warnings;
use IPC::Open3;
use File::Spec;

BEGIN{  use_ok 'Alien::MuPDF' }

my $p = Alien::MuPDF->new;

my $mutool_path = -r $p->mutool_path
	? $p->mutool_path                    # installed path
	: File::Spec->catfile( $p->dist_dir, # path when building
		qw(build release mutool));
my($wtr, $rdr, $err);
use Symbol 'gensym'; $err = gensym;
my $pid = open3($wtr, $rdr, $err,
	$mutool_path, "-v" );
# WARN: this could block --- I should use select() or IPC::Run3, but this may work for now
my $result = join "", <$err>;
waitpid( $pid, 0 );

like($result, qr/mutool version/, 'can run mutool');


done_testing;
