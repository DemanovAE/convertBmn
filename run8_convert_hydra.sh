#!/bin/bash

#SBATCH -p mephi
#SBATCH -t 10:00:00
#SBATCH --mem=8GB
#SBATCH -J Converter
#SBATCH -a 1-999
#SBATCH -o /lustre/home/user/a/ademanov/bmn/data/log_convert/%A_%a.out
#SBATCH -e /lustre/home/user/a/ademanov/bmn/data/log_convert/%A_%a.err

digi_directory=/eos/eosnica.jinr.ru/nica/bmn/exp/digi/run8/24.04.0/
dst_directory=/eos/eosnica.jinr.ru/nica/bmn/exp/dst/run8/24.04.0/

CONVERTER_MACRO=/lustre/home/user/a/ademanov/bmn/convertBmn_run8.C

file_list=$1
out_dir=$2
number_part=$3

TASK_ID=$((number_part*999+SLURM_ARRAY_TASK_ID))

mkdir -p $out_dir
mkdir -p "${out_dir}/log"
cd $out_dir

name_file_root=$(basename $(head -n $TASK_ID $file_list | tail -n 1 ))
name_file=${name_file_root%.root*}
input_file_dst=${dst_directory}/${name_file}.root
input_file_digi=${digi_directory}/${name_file}.root
output_file=${out_dir}/${name_file}.tree.root
output_log=${out_dir}/log/convert_${SLURM_ARRAY_JOB_ID}_${SLURM_ARRAY_TASK_ID}_${name_file}.log

module add GVR
source /cvmfs/nica.jinr.ru/centos7/bmn/env.sh
source /cvmfs/nica.jinr.ru/centos7/bmnroot/dev/bmnroot_config.sh

echo "Node name: ${SLURMD_NODENAME}" &>> ${output_log}
echo "line: ${TASK_ID}" &>> ${output_log}
echo "name: ${name_file}" &>> ${output_log}
echo "input digi: ${input_file_digi}" &>> ${output_log}
echo "input dst: ${input_file_dst}" &>> ${output_log}
echo "output tree: ${output_file}" &>> ${output_log}

time root -l -q ${CONVERTER_MACRO}"(\"${input_file_dst}\", \"${input_file_digi}\", \"${output_file}\")" &>> ${output_log}

echo "Done!" &>> ${output_log}
