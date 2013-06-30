#! perl

package [% module.name %];

use warnings;
use strict;

=head1 NAME

[% module.name %] - The great new [% module.name %]!

=cut

our $VERSION = '[% module.version %]';

=head1 SYNOPSIS

Quick summary of what the module does.

Perhaps a little code snippet.

    use [% module.name %];

    my $foo = [% module.name %]->new();
    ...

=head1 EXPORT

A list of functions that can be exported.  You can delete this section
if you don't export anything, such as for a purely object-oriented module.

=head1 FUNCTIONS

=head2 function1

=cut

sub function1 {
}

=head2 function2

=cut

sub function2 {
}


=head1 AUTHOR

[% author.name %], C<< <[% author.cpan-id %] at cpan.org> >>


=head1 BUGS

Please report any bugs or feature requests to C<bug-[% module.distname.lc %] at rt.cpan.org>, or through
the web interface at L<http://rt.cpan.org/NoAuth/ReportBug.html?Queue=[% module.distname %]>.  I will be notified, and then you'll
automatically be notified of progress on your bug as I make changes.


=head1 SUPPORT

You can find documentation for this module with the perldoc command.

    perldoc [% module.name %]

You can also look for information at:

=over 4

=item * RT: CPAN's request tracker

L<http://rt.cpan.org/NoAuth/Bugs.html?Dist=[% module.distname %]>

=item * Search CPAN

L<http://search.cpan.org/dist/[% module.distname %]>

=back


=head1 ACKNOWLEDGEMENTS


=head1 COPYRIGHT & LICENSE

Copyright [% current.year %] [% author.name %], all rights reserved.

This program is free software; you can redistribute it and/or modify it
under the same terms as Perl itself.

=cut

1; # End of [% module.name %]
