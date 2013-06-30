#! perl

package App::Module::Setup;

use warnings;
use strict;
use Carp;

=head1 NAME

App::Module::Setup - a simple setup for a new module

=cut

our $VERSION = '0.01';


=head1 SYNOPSIS

Nothing in here is meant for public consumption. Use F<module-setup>
from the command line.

    module-setup --author="A.U. Thor" --email=a.u.thor@example.com Foo::Bar

=head1 DESCRIPTION

This is the core module for App::Module::Setup. If you're not looking
to extend or alter the behavior of this module, you probably want to
look at L<module-setup> instead.

App::Module::Setup is used to create a skeletal CPAN distribution,
including basic builder scripts, tests, documentation, and module
code. This is done through just one method, C<main>.

=head1 METHODS

=head2 App::Module::Setup->main( $options )

C<main> is the only method you should need to use from outside this
module; all the other methods are called internally by this one.

This method creates the distribution and populates it with the all the
requires files.

It takes a reference to a hash of params, as follows:

    module       => $module,   # module to create in distro
    version      => $version,  # initial version
    author       => $author,   # author's full name (taken from C<getpwuid> if not provided)
    email        => $email,    # author's email address
    verbose      => $verbose,  # bool: print progress messages; defaults to 0

=cut

sub main {
    my $options = shift;

    # Just in case we're called as a method.
    eval { $options->{module} || 1 } or $options = shift;

    my $mod = $options->{module};

    # Replacement variables
    my $vars =
      { "module.name"    => $mod,	# Foo::Bar
	"module.version" => "0.01",
	"current.year"   => 1900 + (localtime)[5],
	"author.name"    => $options->{author} || (getpwuid($<))[6],
	"author.email"   => $options->{email},
	"author.cpan-id" => $options->{"cpan-id"},
      };

    ( my $t = $mod ) =~ s/::/-/g;
    $vars->{"module.distname"} = $t;	# Foo-Bar
    $vars->{"module.distnamelc"} = lc($t);
    ( $t = $mod ) =~ s/::/\//g;
    $vars->{"module.filename"} = $t . ".pm";	# Foo/Bar.pm
    $vars->{"author.cpan-id"} ||= $1
      if $options->{email} =~ /^(.*)\@cpan.org$/i;
    $vars->{"author.cpan-id"} = uc( $vars->{"author.cpan-id"} );

    use Data::Dumper;
    warn Dumper($vars);
}


=head1 AUTHOR

Johan Vromans, C<< <jv at cpan.org> >>


=head1 BUGS

Please report any bugs or feature requests to C<bug-app-module-setup at rt.cpan.org>, or through
the web interface at L<http://rt.cpan.org/NoAuth/ReportBug.html?Queue=App-Module-Setup>.  I will be notified, and then you'll
automatically be notified of progress on your bug as I make changes.


=head1 SUPPORT

You can find documentation for this module with the perldoc command.

    perldoc App::Module::Setup

You can also look for information at:

=over 4

=item * RT: CPAN's request tracker

L<http://rt.cpan.org/NoAuth/Bugs.html?Dist=App-Module-Setup>

=item * Search CPAN

L<http://search.cpan.org/dist/App-Module-Setup>

=back


=head1 ACKNOWLEDGEMENTS

David Golden, for giving me the final incentive to write this module.

Sawyer X, for writing Module::Starter where I borrowed many ideas from.


=head1 COPYRIGHT & LICENSE

Copyright 2013 Johan Vromans, all rights reserved.

This program is free software; you can redistribute it and/or modify it
under the same terms as Perl itself.


=cut

1; # End of App::Module::Setup
