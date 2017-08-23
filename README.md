# 网页数据解析 #

国自然数据采集之perl快速提取网页Table

数据采集源：http://www.letpub.com.cn/

采集工具：perl

网页采集代码：

    use LWP::Simple;

    foreach my $n ( 1 .. 2) {

        getstore('http://www.letpub.com.cn/index.php?page=grant&name=&person=&no=&company=&startTime=2017&endTime=2017&money1=&money2=&subcategory=&addcomment_s1=662&addcomment_s2=0&addcomment_s3=0&currentpage=' . $n .'#fundlisttable', "H_$n.html");

        sleep 1;

    }

网页分析代码：
    
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

注意：以上内容仅供学习，请勿用作其他用途。