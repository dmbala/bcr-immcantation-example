
## BCR analysis 

A collection of Job and build scripts for the analysis of B-Cells using the immcantation framework. 

## List of files to run the jobs

Inside the Job folder, you will see the following files to run a simple job on Amarel cluster. 

    alakazam_test.R
    run_alakazam-test.slurm
    run_wrapper.sh

`alakazam_test.R` is a simple R script, which is executed inside a singularity container. The script `run_wrapper.sh` executes the R script inside the container.  This sample job is submitted via the slurm script `run_alakazam-test.slurm`. 


To test the job, run 

    sbatch run_alakazam-test.slurm

and to check the status 

    squeue -u netid

Upon successful completion, your run directory should contain an image file `alakazam-test.jpg`. 

The singularity file is created from the docker image. You can create the image using the build files in the build directory or use the existing singularity file in the Amarel cluster. 



