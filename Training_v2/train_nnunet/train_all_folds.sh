#!/bin/bash

# Give dataset number as argument
for fold in {0..4}; do
    sbatch slurm_train_nnunet_${fold}.sh $1
done

