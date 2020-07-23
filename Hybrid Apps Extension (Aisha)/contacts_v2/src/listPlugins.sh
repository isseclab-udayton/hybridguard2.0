#This script scans the 

if [ $# -eq 1 ];then
        DIR_TO_LIST_PLUGINS=$1
        x=$(grep -nR cordova.define $DIR_TO_LIST_PLUGINS | cut -d'"' -f2)

        arr=($x)
#        echo $x
        rm -rf tmp.txt
        for plugin in ${arr[@]}
        do
                dir=$(echo $plugin | cut -d'.' -f1)
                echo $plugin >> tmp.txt
        done
        sort tmp.txt -o tmp.txt
        cat tmp.txt | uniq 
        rm -rf tmp.txt
else
echo "Usage : $0 <Path To find Plugins in>"
fi
