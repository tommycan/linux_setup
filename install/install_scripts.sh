#!/bin/bash

dst_dir=~/scripts
src_dir=$(realpath $(dirname ${0})/../scripts)

[ ! -d ${dst_dir} ] && mkdir ${dst_dir}

src_files=$(find ${src_dir} -type f)
for src_file in ${src_files}; do
    link_name=${dst_dir}/$(basename ${src_file})
    [ ! -e ${link_name} ] && ln -sv ${src_file} ${link_name}
done
