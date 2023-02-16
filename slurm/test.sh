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
which gcc
python data/shakespeare_char/prepare.py
time python -u train.py config/train_shakespeare_char_small.py
