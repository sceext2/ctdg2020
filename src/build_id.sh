#!/usr/bin/fish
# build_id.sh

set F_BUILDID "./pack/BUILDID"

# read
set i (cat $F_BUILDID)

# add
set i (expr $i + 1)

# write
echo $i > $F_BUILDID

# output
echo $i

# 20200312 0635
