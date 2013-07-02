#!perl

use Test::More;
use File::Path qw( remove_tree );
use File::Find;

my $tests = 1;

BEGIN {
    use_ok( 'App::Module::Setup' );
}

diag( "Testing App::Module::Setup $App::Module::Setup::VERSION, Perl $], $^X" );

# Set up a clean working directory.
$tests++, ok( chdir("t"), "Change to test dir" ) if -d "t";
$tests += 2;
remove_tree("ivp");
ok( mkdir("ivp"), "Create new work dir" );
chdir("ivp") or BAIL_OUT("Error creating directory for testing");
ok( 1, "Work dir set up " );

# Test run.
ok( App::Module::Setup->main
    ( { author => "Johan Vromans",
	email  => "jv\@cpan.org",
	module => "App::Module::Setup",
	template => "default",
	_package => "Sciurix",
	_name => "module-setup",
	_version => $App::Module::Setup::VERSION,
      } ), "Run App::Module::Setup" );
$tests++;

# Find all files, and compare with their reference versions.

my $dir = "App-Module-Setup";
my $dl = length("$dir/");

find( { wanted => sub {
	    return if length($_) < $dl; # skip top
	    my $f = substr( $_, $dl );
	    return unless -f $_;
	    ok( !diff( $_, "../ref/default/$f" ), "Verify $_" );
	    $tests++;
	},
	no_chdir => 1,
      }, $dir );

done_testing($tests);

################ Subroutines ################

sub diff {
    my ($file1, $file2) = @_;
    my ($str1, $str2);
    local($/);
    open(my $fd1, "<", $file1) or die("$file1: $!\n");
    $str1 = <$fd1>;
    close($fd1);
    open(my $fd2, "<", $file2) or die("$file2: $!\n");
    $str2 = <$fd2>;
    close($fd2);
    $str1 =~ s/[\n\r]+/\n/;
    $str2 =~ s/[\n\r]+/\n/;
    return 0 if $str1 eq $str2;
    1;
}
