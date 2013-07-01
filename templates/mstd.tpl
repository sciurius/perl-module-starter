#!/usr/bin/perl

# THIS IS A GENERATED MODULE -- DON'T EDIT!

use strict;
use warnings;

package App::Module::Setup::Templates::Default;

use File::Basename qw(dirname);

our $VERSION = "0.01";

my $sar = <<'EOD';
[%# FILEDATA GOES HERE %]
EOD

my @files;
my @dirs;
my %data;

sub load {
    my ( $self ) = ( @_ );

    return ( \@files, \@dirs, \%data ) if @files;

    open( my $fd, '<', \$sar );
    my $file;
    my %dirs;
    while ( <$fd> ) {
	if ( /\[\%\s*FILE\s+(.*?)\s*\%\]/ ) {
	    push( @files, $file = $1 );
	    $dirs{ dirname($file) }++ if dirname($file);
	}
	elsif ( $file ) {
	    $data{$file} .= $_;
	}
	else {
	    die("Internal error: Leading data in sar");
	}
    }
    @dirs = sort keys %dirs;
    ( \@files, \@dirs, \%data );
}

1;

