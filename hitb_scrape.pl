#!/usr/bin/perl
# Downloads Hack In The Box Magazines
use strict;
use warnings;
use LWP::Simple;

for (my $i=1;$i<1000;$i++){
	my $url=sprintf("http://magazine.hitb.org/issues/HITB-Ezine-Issue-%03d.pdf",$i);
	my $pdf=sprintf("HITB-Ezine-Issue-%03d.pdf",$i);
	next if (-e $pdf);
	my $status=getstore($url,$pdf);
	if(is_error($status)){
		print "[$status] Couldn't download: $url\n";
		last;
	}
	else{
		print "[$status] Downloaded: $url\n";
	}
}
