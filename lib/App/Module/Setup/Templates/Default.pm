#!/usr/bin/perl

use strict;
use warnings;

package App::Module::Setup::Templates::Default;

our $VERSION = "0.01";

my $sar = <<'EOD';
[% FILE Changes %]
[% FILE lib/Module.pm %]
[% FILE Makefile.PL %]
[% FILE MANIFEST %]
[% FILE README %]
[% FILE t/00-load.t %]
EOD

1;

