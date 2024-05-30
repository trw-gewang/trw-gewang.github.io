#!/perl/bin/perl -w

#use DateTime;
use HTTP::Tiny;
open(OUTFILE,">my_test.txt") or die "Could not open Data.txt.\n";

print OUTFILE "this is a test.  current time: ", time();

close(OUTFILE);
exit();