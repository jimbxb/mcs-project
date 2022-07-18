N=${1}
echo $N 
cat /dev/urandom | sed 's/\n//' | fold -w $N | head -n 1 
cat /dev/urandom | sed 's/\n//' |  fold -w 100 | head -n $N 
awk -v n=$N -v seed="$RANDOM" 'BEGIN { srand(seed); for (i=0; i<n; ++i) printf("%.6f\n", rand()) }' 
shuf -i 1-100000 -n $N