#!/bin/bash

#SBATCH --qos=gpushort
#SBATCH --job-name=test_job
###SBATCH --account=heitzig
#SBATCH --output=test-%j.out
#SBATCH --error=test-%j.err
#SBATCH --workdir=/p/tmp/heitzig

hostname