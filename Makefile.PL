use strict;
use warnings;

use 5.006;

use ExtUtils::MakeMaker 6.17;

my %WriteMakefileArgs = (
  "ABSTRACT" => "Install CPAN::Reporter and related dependencies",
  "AUTHOR" => "David Golden <dagolden\@cpan.org>",
  "CONFIGURE_REQUIRES" => {
    "ExtUtils::MakeMaker" => "6.17"
  },
  "DISTNAME" => "Task-CPAN-Reporter",
  "LICENSE" => "apache",
  "MIN_PERL_VERSION" => "5.006",
  "NAME" => "Task::CPAN::Reporter",
  "PREREQ_PM" => {
    "CPAN::Meta::YAML" => "0.016",
    "CPAN::Reporter" => "1.1902",
    "IO::Socket::SSL" => "1.42",
    "Mozilla::CA" => 0,
    "Net::SSLeay" => "1.49",
    "Test::Reporter::Transport::Metabase" => "1.999008",
    "strict" => 0,
    "warnings" => 0
  },
  "TEST_REQUIRES" => {
    "ExtUtils::MakeMaker" => 0,
    "File::Spec" => 0,
    "Test::More" => 0
  },
  "VERSION" => "0.004",
  "test" => {
    "TESTS" => "t/*.t"
  }
);


my %FallbackPrereqs = (
  "CPAN::Meta::YAML" => "0.016",
  "CPAN::Reporter" => "1.1902",
  "ExtUtils::MakeMaker" => 0,
  "File::Spec" => 0,
  "IO::Socket::SSL" => "1.42",
  "Mozilla::CA" => 0,
  "Net::SSLeay" => "1.49",
  "Test::More" => 0,
  "Test::Reporter::Transport::Metabase" => "1.999008",
  "strict" => 0,
  "warnings" => 0
);


unless ( eval { ExtUtils::MakeMaker->VERSION(6.63_03) } ) {
  delete $WriteMakefileArgs{TEST_REQUIRES};
  delete $WriteMakefileArgs{BUILD_REQUIRES};
  $WriteMakefileArgs{PREREQ_PM} = \%FallbackPrereqs;
}

delete $WriteMakefileArgs{CONFIGURE_REQUIRES}
  unless eval { ExtUtils::MakeMaker->VERSION(6.52) };

WriteMakefile(%WriteMakefileArgs);
