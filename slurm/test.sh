#!/bin/bash

#SBATCH --qos=gpupreempt
#SBATCH --job-name=test_job
###SBATCH --account=heitzig
#SBATCH --output=test-%j.out
#SBATCH --error=test-%j.err
#SBATCH --workdir=/p/tmp/heitzig

source activate torch
hostname
