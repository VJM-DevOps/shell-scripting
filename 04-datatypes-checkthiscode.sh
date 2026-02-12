NUM1=$1
NUM2=$2
TIMESTAMP=$(date)
echo "The script started execution at $TIMESTAMP"
SUM=$((${NUM1}+${NUM2}))
if [ $? -ne 0 ]
then
    echo "please give run time values it takes 2 values: eg: $0 value1 value2"
    exit 1
else
    echo "The sum of ${NUM1} and ${NUM2} is:: $SUM"
fi