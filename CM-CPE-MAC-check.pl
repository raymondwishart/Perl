#!/usr/bin/perl
#CM-CPE-MAC-check.pl
#use warnings;

print "What is the filename containing the modem IP address?\n";
$filename = <STDIN>;
chop($filename);

print "What do you want to name the outputfile?\n";
    $outputfile = <STDIN>;
chop($outputfile);

open(IP, "$filename") || die "Could not open $filename...\n";

while (<IP>)
{
    ($macaddress,$ipaddress,$cable,$online,$sid,$rxpwr,$timingoffsett,$cpe,$bpi) = split(/\s+/,$_);
    system "echo -n '$cable, $macaddress, ''$ipaddress:\n' >> $outputfile";
    system "snmpwalk -v 2c -c <snip> $ipaddress .1.3.6.1.2.1.17.4.3.1.1 | egrep -i '7c bf b1 7d 53 5' >> $outputfile";
    #system "echo -n $snmpoutput >> $outputfile";
}

print "\n end of ip addresses for $filename \n"; #to show script is still active
