#!/bin/bash
#SBATCH --job-name=prep
#SBATCH --partition=short
#SBATCH --time=2:00:00
#SBATCH --nodes=1
#SBATCH --cpus-per-task=16
#SBATCH --output=logs_preprocess/preprocess_%j.out
#SBATCH --error=logs_preprocess/preprocess_%j.err
#SBATCH --mail-type=BEGIN,END,FAIL,REQUEUE
#SBATCH --mail-user=m.j.vandepol@erasmusmc.nl


# Load modules and virtual environment
module purge
module load Python/3.11.5-GCCcore-13.2.0
source ~/venv/cranio_env/bin/activate
module list


# Run script 
nnUNetv2_plan_and_preprocess -d Dataset002_Brain_T2 --verify_dataset_integrity -c 3d_fullres
