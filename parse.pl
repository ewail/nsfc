#!/usr/perl/bin
use warnings;
use strict;
use autodie;
use HTML::TableExtract;
use Encode;
use Data::Dumper qw(Dumper);

#http://www.letpub.com.cn/index.php?page=grant
my @html = <*.html>;
open my $out, ">", "nsfc_2017.txt";
foreach my $h (@html)
{
    open my $in, "<", $h;
    my $html_string = join("", <$in>);
    my $te = HTML::TableExtract->new();
    $te->parse($html_string);
    close($in);
    foreach my $ts ($te->tables) {
        if (($ts->coords)[1] == 2) {
            
            for(my $i = 2; $i < @{$ts->rows} - 1; $i += 3)
            {
                foreach my $r (@{@{$ts->rows}[$i]})
                {
                    print $out  encode("gbk", decode("utf8", $r)), "\t" if defined $r;
                    
                }
                foreach my $r (@{@{$ts->rows}[$i+1]})
                {
                    print $out  encode("gbk", decode("utf8", $r)), "\t" if defined $r;
                    
                }
                foreach my $r (@{@{$ts->rows}[$i+2]})
                {
                    print $out  encode("gbk", decode("utf8", $r)), "\t" if defined $r;
                    
                }
                print $out "\n";
            }
        }
    }
}

close($out);
print "All done!\n";