#!/bin/bash
#SBATCH --job-name=train_fold4
#SBATCH --partition=long
#SBATCH --time=52:00:00
#SBATCH --gres=gpu:1
#SBATCH --cpus-per-task=8
#SBATCH --output=logs_train/train_fold4_%j.out
#SBATCH --error=logs_train/train_fold4_%j.err
#SBATCH --mail-type=BEGIN,END,FAIL
#SBATCH --mail-user=m.j.vandepol@erasmusmc.nl

export OMP_NUM_THREADS=1
export MKL_NUM_THREADS=1

# Load modules and virtual environment
module purge
module load Python/3.11.5-GCCcore-13.2.0
source ~/venv/cranio_env/bin/activate
module list


# Run script 
nnUNetv2_train Dataset002_Brain_T2 3d_fullres 4 -p nnUNetPlans 

# Add --c if continuing
