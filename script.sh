wget -H -w 2 -m http://www.gutenberg.org/robot/harvest?filetypes[]=txt&langs[]=en \
--referer="http://www.google.com" \
--user-agent="Mozilla/5.0 (Windows; U; Windows NT 5.1; en-US; rv:1.8.1.6) Gecko/20070725 Firefox/2.0.0.6" \
--header="Accept: text/xml,application/xml,application/xhtml+xml,text/html;q=0.9,text/plain;q=0.8,image/png,*/*;q=0.5" \
--header="Accept-Language: en-us,en;q=0.5" \
--header="Accept-Encoding: gzip,deflate" \
--header="Accept-Charset: ISO-8859-1,utf-8;q=0.7,*;q=0.7" \
--header="Keep-Alive: 300";


cd aleph.gutenberg.org\;

# Unzip all downloads
find . -name "*.zip" -exec unzip {}\;

# remove leftover subdirectories
rm -R -- *(/)\;

# remove duplicate files marked with '-8'
rm *-8*\;

# Convert txt to pdf files to use on your kindle
find ./ -iname "*.txt" -exec sh -c 'pandoc "${0}" -o "${0%.md}.pdf"' {}\;
