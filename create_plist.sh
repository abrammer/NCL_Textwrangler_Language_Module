#!/bin/csh

wget -q -O- https://www.ncl.ucar.edu/Document/Graphics/Resources/list_alpha_res.shtml | pcregrep -M '<dt>.*\n.*strong>' | sed '/<dt>/d;s/.*\/a><strong>/<string>/g;s/<\/strong>.*/<\/string>/g;/<dd>/d' | awk ''!'x[$1]++' > reslist.txt
wget -q -O- https://www.ncl.ucar.edu/Document/Functions/list_alpha_browse.shtml | grep "<!" | head -n -4 | tail -n +2 | sed 's/<!\-\-/<string>/g;s/\-\->/<\/string>/g' > funclist.txt

cat ncl_plist_header.txt reslist.txt funclist.txt ncl_plist_footer.txt > NCL.plist
