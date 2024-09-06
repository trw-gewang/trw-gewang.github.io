#!/perl/bin/perl -w

######### Start ###################################
#load_data('^GSPC');
load_data('WEBL');
#load_data(TECL);
#load_data(SOXL);
exit();

######### mk Data for Pandas ######################
sub load_data{
my $ticker = $_[0]; print "$ticker\n";
#$lead ='https://query1.finance.yahoo.com/v7/finance/download/';
my $lead ='https://query2.finance.yahoo.com/v7/finance/download/';
my $tail ='&events=history&includeAdjustedClose=true';
#my $ed=time(); my $st=$ed-10*365*24*3600; # 10 yr earlier
my $ed=time(); my $st=$ed-4*365*24*3600; # 4 yr earlier
my $url=$lead.$ticker."?period1=".$st."&period2=".$ed."&interval=1d".$tail;
my $raw=get_raw($url);
open(OUTFILE,">$ticker.csv") or die "Could not open $ticker.csv.\n";
print OUTFILE "$raw";
close(OUTFILE);
};

sub get_raw{my $url=$_[0]; use HTTP::Tiny;
    return HTTP::Tiny->new(default_headers=>{Accept=>'*/*'})->get($url)->{content}};
