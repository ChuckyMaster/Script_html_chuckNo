
#!/bin/bash/path/to/chuck.sh

openH2="<h2>"
closeH2="</h2>"


str1="<!DOCTYPE html>
<html lang="en">
<head>
    
    <title>Document</title>
    </head>
<body>
<p>"



  str2="chuck machin machin truc toussa toussa"




    str3="</p></body>
</html>"


str4="${str1}${openH2}${liste_blagues[@]}${closeH2}${str3}"

echo "$str4" > page1.html

firefox page1.html 