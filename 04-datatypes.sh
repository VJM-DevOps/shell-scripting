NUM1=$1
NUM2=$2
TIMESTAMP=$(date)
echo "The script started execution at $TIMESTAMP"
SUM=$((${NUM1}+${NUM2}))
echo "The sum of ${NUM1} and ${NUM2} is:: $SUM"