#!/usr/bin/perl -w
use strict;
my $printing = 0;
print "# Andrew J. Zimolzak, Curriculum Vitae\n\n";
while(<>){
    $printing = 1 if /Education/;
    s/\{.*unnumbered\}//;
    print if $printing;
}
