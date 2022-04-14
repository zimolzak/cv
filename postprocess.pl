#!/usr/bin/perl -w
use strict;
my $printing = 0;
while(<>){
    if (/# Education/) {
	print "# Andrew J. Zimolzak, Curriculum Vitae\n\nzimolzak\@bcm.edu\n\n";
	$printing = 1;
    }
    s/ \{.*unnumbered\}//;
    print if $printing;
}
