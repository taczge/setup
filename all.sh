#!/bin/sh

for i in `ls | grep [0-9][0-9]-.*.sh | sort`; do
    ./$i
done

#sudo shutdown -r now

# end of file
