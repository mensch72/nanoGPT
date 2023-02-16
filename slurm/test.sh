#!/bin/bash

#SBATCH --qos=gpupreempt
#SBATCH --partition=gpu
#SBATCH --gres=gpu:v100:1
#SBATCH --job-name=test_job
###SBATCH --account=heitzig
#SBATCH --output=test-%j.out
#SBATCH --error=test-%j.err
#SBATCH --workdir=/p/tmp/heitzig

source activate torch
cd /home/heitzig/gane/rl/git/nanoGPT
module load intel/2018.3
module show intel/2018.3
#module load mpi/intel/5.1.3
module list
which cc
python data/shakespeare_char/prepare.py
time python -u train.py config/train_shakespeare_char_small.py --device=cuda --out_dir=/p/tmp/heitzig/out-shakespeare-char
time python -u train.py config/train_shakespeare_char_small_ternary.py --device=cuda --out_dir=/p/tmp/heitzig/out-shakespeare-char-ternary
