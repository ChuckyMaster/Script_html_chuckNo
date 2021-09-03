#!/bin/bash

starter=true
liste_blagues=()

while $starter; do
    echo "tu veux une blague random?"
    read reponse
    if [ $reponse = yes ]; then
        blague=$(curl -s https://api.chucknorris.io/jokes/random | jq -r ".value")

    else
        echo "voila la liste des categories"
        liste=$(curl -s https://api.chucknorris.io/jokes/categories | jq -r .[])

        for i in "${liste[@]}"; do
            echo "$i"
            echo "-------------------------------------------------------"
            echo "choisi une categorie de blague"
            read choseCategorie
            blague=$(curl -s https://api.chucknorris.io/jokes/random?category=$choseCategorie | jq -r ".value")
        done
    fi

    echo $blague
    # liste_blagues=(test test2)
    liste_blagues+=("$blague")

    printf "%s\n" "${liste_blagues[@]}"

    #  awk {printf$0}  "${liste_blagues[@]}\n"
    # IFS=$\n
    # liste_blagues=($(awk "{printf("%s\n", $0) }" "$1"))

    echo "-------------------"
    echo " une autre? "
    read uneAutre
    if [ $uneAutre != oui ]; then
        starter=false

    fi

done



# str4="${str1}${openH2}${liste_blagues[@]}${closeH2}${str3}"

# echo "$str4" >page1.html

# firefox page1.html


echo "on garde ca?"
read onGarde
 
if [ $onGarde = oui ]
    then 
        echo ${liste_blagues[@]} >> blagues.txt
fi        

openH2="<h2>"
closeH2="</h2>"

str1="<!DOCTYPE html>
<html lang="en">
<head>
    
    <title>Document</title>
    </head>
<body>
<p>"

# str2="chuck machin machin truc toussa toussa"

str3="</p></body>
</html>"




echo "Veux tu l'enregistrer sur un site web? Oui? Non?"
read ouiOuNOn

if [ $ouiOuNOn = oui ]; 
then
    # blagues= echo ${liste_blagues[@]} >>blagues.txt

    pageWeb=""
    pageWeb+=$str1

    for blagueChuck in "${liste_blagues[@]}"
        do 
            blagueHtml=""
            blagueHtml+=$openH2
            blagueHtml+="$blagueChuck"
            blagueHtml+=$closeH2

            pageWeb+=$blagueHtml
        done    

    pageWeb+=$str3

    echo $pageWeb > index.html
    cp index.html /var/www/html/index.html

   



fi