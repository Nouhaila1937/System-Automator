noms=("Bob" "Charlie" "Diana" "Edward" )
# Boucle
for (( i =0,j=${#noms[@]}-1;i<=j;i++))
do
echo "Nom $i:${noms[i]}"
done
 