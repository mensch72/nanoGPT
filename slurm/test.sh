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
module load compiler/gnu/7.3.0
module load intel/2018.3
#module load mpi/intel/5.1.3
export CC=icc
module list
which icc
python data/shakespeare_char/prepare.py
time python -u train.py config/train_shakespeare_char_small_ternary2.py --device=cuda --compile=False --max_iters=3000 --lr_decay_iters=3000 --out_dir=/p/tmp/heitzig/out-shakespeare-char-ternary2
time python -u train.py config/train_shakespeare_char_small.py --device=cuda --compile=False --max_iters=3000 --lr_decay_iters=3000 --out_dir=/p/tmp/heitzig/out-shakespeare-char
time python sample.py --out_dir=/p/tmp/heitzig/out-shakespeare-char-ternary2 --device=cuda --compile=False
time python sample.py --out_dir=/p/tmp/heitzig/out-shakespeare-char --device=cuda --compile=False
