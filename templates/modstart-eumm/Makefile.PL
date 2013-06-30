use strict;
use warnings;
use ExtUtils::MakeMaker;

WriteMakefile(
    NAME                => '[% module.name %]',
    AUTHOR              => '[% author.name %] <[% author.email %]>',
    VERSION_FROM        => 'lib/[% module.filename %]',
    ABSTRACT_FROM       => 'lib/[% module.filename %]',
    PL_FILES            => {},
    PREREQ_PM => {
        'Test::More' => 0,
    },
    dist                => { COMPRESS => 'gzip -9f', SUFFIX => 'gz', },
    clean               => { FILES => '[% module.distname %]-*' },
);
