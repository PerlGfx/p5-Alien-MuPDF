
use strict;
use warnings;

use Module::Build 0.3601;
use lib qw{inc}; use Alien::Base::ModuleBuild;

my %module_build_args = (
  "alien_name" => "MuPDF",
  "alien_repository" => {
    "host" => "mupdf.googlecode.com",
    "location" => "/files/mupdf-1.2-source.zip",
    "pattern" => qr/(?^:^$)/,
    "protocol" => "https"
  },
  "build_requires" => {},
  "configure_requires" => {
    "Alien::Base" => "0.002",
    "File::ShareDir" => "1.03",
    "Path::Class" => "0.013"
  },
  "dist_abstract" => "Alien package for the MuPDF PDF rendering library",
  "dist_author" => [
    "Zakariyya Mughal <zmughal\@cpan.org>"
  ],
  "dist_name" => "Alien-MuPDF",
  "dist_version" => "0.001",
  "license" => "perl",
  "module_name" => "Alien::MuPDF",
  "recommends" => {},
  "recursive_test_files" => 1,
  "requires" => {
    "Alien::Base" => "0.002",
    "File::ShareDir" => "1.03",
    "Path::Class" => "0.013",
    "parent" => 0,
    "strict" => 0,
    "warnings" => 0
  },
  "script_files" => [],
  "test_requires" => {}
);


unless ( eval { Module::Build->VERSION(0.4004) } ) {
  my $tr = delete $module_build_args{test_requires};
  my $br = $module_build_args{build_requires};
  for my $mod ( keys %$tr ) {
    if ( exists $br->{$mod} ) {
      $br->{$mod} = $tr->{$mod} if $tr->{$mod} > $br->{$mod};
    }
    else {
      $br->{$mod} = $tr->{$mod};
    }
  }
}

my $build = Alien::Base::ModuleBuild->new(%module_build_args);

$build->create_build_script;
