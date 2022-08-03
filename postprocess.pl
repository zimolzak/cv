#!/usr/bin/perl -w

# Cut out certain sections from README.md.
# usual usage: perl -i postprocess.pl README.md

use strict;
my $printing = 0;
while(<>){
    if (/# Education/) {
	print "# Andrew J. Zimolzak, Curriculum Vitae\n\nzimolzak\@bcm.edu\n\n";
	$printing = 1;  # Skip the prelim stuff. First section is Education.
    }
    if (/# References/) {  # Last section is Service. Skip Refs.
	$printing = 0;
    }
    # clean up pandoc doots
    s/ \{.*unnumbered\}//;
    s/--/-/g;
    s/9-1186\\/9-1186 .\\/;
    print if $printing;
}
