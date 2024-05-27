#!/perl/bin/perl -w

use DateTime;
open(OUTFILE,">my_test.txt") or die "Could not open Data.txt.\n";

print OUTFILE "this is a test.  current time: ", DateTime->now;

close(OUTFILE);
exit();