#!/usr/bin/fish
# bundle_02.sh

# get BUILDID
set BUILDID (fish ./build_id.sh)
echo "BUILDID  $BUILDID"

# output bundle file
set F_OUT "../pack/卷一怀璧其罪_网状植物生命体-$BUILDID.txt"

# src dir
function goto_src
  cd 02_*
end

# reset F_OUT
function pack_start
  echo "" > $F_OUT
end

# pack one file
function pack_one
  set f $argv[1]
  echo "+ $f"

  cat $f >> $F_OUT
  echo "" >> $F_OUT
end

# add one line label
function add_label
  set l $argv[1]
  echo "LABEL  $l"

  echo $l >> $F_OUT
  echo "" >> $F_OUT
end

# pack a group of file
function pack_group
  set start $argv[1]
  set end $argv[2]

  # current file list
  set fl (ls | sort)
  
  for i in $fl
    set n (echo $i | string split "_")[1]
    
    if test $n -le $end -a $n -ge $start
      pack_one $i
    end
  end
end

# add pack end info
function pack_end
  set t (node -e "console.log(new Date().toISOString())")

  echo $t
  echo $t >> $F_OUT
end

# clean c2a0 BUG
function clean_c2a0
  node ../no_c2a0-1.js $F_OUT
  node ../trim_line-1.js $F_OUT
end

# add file content hash
function add_hash
  set h (sha256sum $F_OUT)
  echo $h >> $F_OUT
  echo $h
end


# main bundle script
function bundle_main
  goto_src

  pack_start

  # 序章
  pack_one 000_*

  add_label "第一卷 怀璧其罪"
  add_label "卷一 怀璧其罪"
  pack_group 001 011

  # TODO

  pack_end
  clean_c2a0
  add_hash
end

# do bundle
bundle_main

# 20200312 0647
