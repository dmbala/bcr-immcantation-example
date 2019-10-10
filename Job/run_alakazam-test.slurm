#!/bin/bash

#SBATCH --partition=oarc            # Partition (job queue)
#SBATCH --job-name=bcr-test           # Assign an short name to your job
#SBATCH --nodes=1                    # Number of nodes you require
#SBATCH --ntasks=1                   # Total # of tasks across all nodes
#SBATCH --cpus-per-task=1            # Cores per task (>1 if multithread tasks)
#SBATCH --mem=1000                   # Real memory (RAM) required (MB)
#SBATCH --time=00:15:00              # Total run time limit (HH:MM:SS)
#SBATCH --output=slurm.%N.%j.out     # STDOUT output file
#SBATCH --error=slurm.%N.%j.err      # STDERR output file (optional)


module load singularity
singularity exec /projects/oarc/users/scripts/BCR/immcantation.sif ./run_wrapper.sh

sleep 3

sacct --format NTasks,MaxRSS,MaxVMSize,AveRSS,AveVMSize,AveCPU -j $SLURM_JOBID

sleep 2

