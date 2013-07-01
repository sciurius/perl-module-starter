#!/usr/bin/perl

use strict;
use warnings;

package App::Module::Setup::Templates;

our $VERSION = "0.01";

use Carp qw(carp croak);

$Carp::Internal{ (__PACKAGE__) }++;

sub templater {
    my ( $text, $vars ) = @_;

    my $repl = sub {
	my ( $key ) = @_;
	unless ( defined $vars->{$key} ) {
	    carp( "No replacement text for $key" );
	    $vars->{$key} = "";
	}
	$vars->{$key};
    };

    $text =~ s/\[\%\s*(.*?)\s*\%\]/$repl->($1)/ge;

    $text;
}

1;
