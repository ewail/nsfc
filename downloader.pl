use LWP::Simple;

#http://www.letpub.com.cn/?page=grant&name=&person=&no=&company=&addcomment_s1=662&addcomment_s2=0&addcomment_s3=0&money1=&money2=&startTime=2017&endTime=2017&subcategory=&searchsubmit=true&submit.x=56&submit.y=9#fundlisttable
foreach my $n ( 1 .. 494) {
    getstore('http://www.letpub.com.cn/index.php?page=grant&name=&person=&no=&company=&startTime=2017&endTime=2017&money1=&money2=&subcategory=&addcomment_s1=662&addcomment_s2=0&addcomment_s3=0&currentpage=' . $n .'#fundlisttable', "H_$n.html");
    sleep 1;
}