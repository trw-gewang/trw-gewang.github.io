#!/perl/bin/perl -w

######### Start ###################################
#my @name = ( XLC, XLY, XLP, XLE);
#my @name = ( XLF, XLV, XLI, XLB);
#my @name = ( XLRE, XLK, XLU, XLB);
my @name = ( TQQQ, TECL, SOXL, UPRO);
my ($t0,$x0,$y0)=load_data($name[0]); 
my ($t1,$x1,$y1)=load_data($name[1]);
my ($t2,$x2,$y2)=load_data($name[2]);
my ($t3,$x3,$y3)=load_data($name[3]);
my $code=load_code();

open(OUTFILE,">kelly.txt") or die "Could not open kelly.txt.\n";
	print OUTFILE "var stk= [\"\0$t0\:\", \"\0$t1\:\", \"\0$t2\:\", \"\0$t3\:\"], br='<br>', b='<b>', to=' to ';";
	print OUTFILE "var _t= [$x0];";
	print OUTFILE "var ss0= [$y0];";
	print OUTFILE "var ss1= [$y1];";
	print OUTFILE "var ss2= [$y2];";
	print OUTFILE "var ss3= [$y3];";
	print OUTFILE $code;
close(OUTFILE);
exit();

######### mk Data for Pandas ######################
sub load_data{
my $ticker = $_[0]; print "$ticker\n";
#$lead ='https://query1.finance.yahoo.com/v7/finance/download/';
my $lead ='https://query2.finance.yahoo.com/v7/finance/download/';
my $tail ='&events=history&includeAdjustedClose=true';
my $ed=time(); my $st=$ed-11*365*24*3600; # 11 yr earlier
my $url=$lead.$ticker."?period1=".$st."&period2=".$ed."&interval=1d".$tail;
my $raw=get_raw($url);
my @df= split(/\n/,$raw);
my @t0=map{my @tmp=split(/,/);$tmp[0]} @df; shift(@t0);
my @x0=map{my @tmp=split(/,/);$tmp[5]} @df; shift(@x0);
my @t=map{my ($yr,$mh,$dy)=split(/-/);sprintf("%.4f", $yr+($mh-1)/12+$dy/365)} @t0;
my @x=map{sprintf("%.4f", log($_))} @x0; return $ticker, join(", ", @t), join(", ", @x)
};

sub get_raw{my $url=$_[0]; use HTTP::Tiny;
    return HTTP::Tiny->new(default_headers=>{Accept=>'*/*'})->get($url)->{content}};

sub load_code{
	my $min = qq^
const wTitle = "Pacific Wave";
let wStyle = "body {background:white; font-family:Courier}";
wStyle += "table {border-collapse:collapse; width:100%}";
wStyle += "textarea {color:lightgreen; background:black; width:100%}";

myUI=()=>{
	const layout = document.createElement("style");
	document.title= wTitle;
	document.head.appendChild(layout);
	layout.innerHTML = wStyle;
	w2.innerHTML = "<b>"+wTitle;
	w1.innerHTML = "<button onclick='run_code(`w5`);mk_water()'>Show Water</button>";
	w1.innerHTML += "<button onclick='run_code(`w5`);mk_tsunami()''>Show Tsunami</button>";
	w1.innerHTML += "<button onclick='run_code(`w5`);mk_ripple()''>Show Ripple</button>";
	w1.innerHTML += "<button onclick='run_code(`w5`);mk_wave()''>Show Wave</button>";
	w2.align="right";
	w1.width="85%";
	w2.width="15%";
};

run_code=(w)=>{	
    let str="";
    try {str = eval(document.getElementById(w).value)} 
	catch(err) {str = err.name+" : "+err.message} 
};

do_plot=(data,mytitle)=>{Plotly.newPlot("myPlot",data,{title:mytitle,showlegend:false},{displayModeBar:false})};

curve4=(t, curve1, curve2, curve3, curve4)=>{
	return [{x:t,y:curve1,line:{width:1}},
			{x:t,y:curve2,line:{width:1}},
			{x:t,y:curve3,line:{width:1}},
			{x:t,y:curve4,line:{width:1}}]
};
	
sum1=(y)=>{return y.reduce((sum,val)=>sum+val,0)};

sum2=(y1,y2)=>{return sum1(y1.map((val, idx)=>{return val * y2[idx]}))};

mean=(y)=>{return sum1(y)/y.length};

base=(t,y)=>{
	var b=(sum2(t,y)*y.length-sum1(t)*sum1(y))/(sum2(t,t)*y.length-sum1(t)*sum1(t)), a=mean(y)-b*mean(t);
	return t.map((val)=>{return a+b*val})};

LAGR=(t,y)=>{
	return (Math.exp((sum2(t,y)*y.length-sum1(t)*sum1(y))/(sum2(t,t)*y.length-sum1(t)*sum1(t)))-1).toFixed(3)};

vec_sub=(y1,y2)=>{return y1.map((val, idx)=>{return val - y2[idx]})};

psych=(t,y)=>{return vec_sub(y,base(t,y))};

ema=(period,y)=>{var a=1/(period+1),b=1-a,ema=y[0]; return y.map((val)=>{ema=b*ema+a*val; return ema})};

psych1=(t,y)=>{return vec_sub(y,ema(t,y))};

wave=(np,t,y)=>{return vec_sub(y,base(t,y))};

ripple=(np,y)=>{var y0=ema(np,y); return vec_sub(y,y0)};

psych2=(np,t,y)=>{var y0=ema(np,y); return vec_sub(y0,base(t,y0))};

tsunami=(np,t,y)=>{var y0=ema(np,y); return vec_sub(y0,base(t,y0))};

mode=(a,y)=>{return vec_sub(ema(a,y),ema(a*1.5,y)).map((val)=>{return a*val})};

y2m=(yr)=>{var yc=yr-Math.floor(yr), mo=[...Array(13).keys()].filter((val)=>val>yc*12); return mo[0]};

y2d=(yr)=>{yc=yr-Math.floor(yr); return Math.round((yc-(y2m(yc)-1)/12)*365)};

date=(yr)=>{return y2m(yr)+"-"+y2d(yr)+"-"+Math.floor(yr)};

var np=0, en0=0, st0=0;
var t0=[], y00=[], y01=[], y02=[], y03=[];
var f00=[], f01=[], f02=[], f03=[];

mk_span=(st0,en0)=>{t0=_t.slice(st0,en0);
y00=ss0.slice(st0,en0);
y01=ss1.slice(st0,en0);
y02=ss2.slice(st0,en0);
y03=ss3.slice(st0,en0);};

mk_plot=()=>{title=b+date(t0[0])+to+date(t0[t0.length-1])+br;
title+=stk[0]+LAGR(t0,y00)+stk[1]+LAGR(t0,y01);
title+=stk[2]+LAGR(t0,y02)+stk[3]+LAGR(t0,y03);
do_plot(curve4(t0,f00,f01,f02,f03),title);};

mk_water=()=>{
f00 = y00;
f01 = y01;
f02 = y02;
f03 = y03;
mk_plot();};

mk_tsunami=()=>{
f00 = tsunami(np,t0,y00);
f01 = tsunami(np,t0,y01);
f02 = tsunami(np,t0,y02);
f03 = tsunami(np,t0,y03);
mk_plot();};

mk_ripple=()=>{
f00 = ripple(np,y00);
f01 = ripple(np,y01);
f02 = ripple(np,y02);
f03 = ripple(np,y03);
mk_plot();};

mk_wave=()=>{
f00 = wave(np,t0,y00);
f01 = wave(np,t0,y01);
f02 = wave(np,t0,y02);
f03 = wave(np,t0,y03);
mk_plot();};


^;
	$min=~s/;\n/;/g;
	$min=~s/\s+/ /g;
	return $min;
};