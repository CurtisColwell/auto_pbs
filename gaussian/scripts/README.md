# How the scripts work

The `submit_gaussian.bash` script will search the input folder for any input
files that do not have any matching output files. Lonely input files are then
used as input for a SLURM job using the `gaussian.srun` job script.

The `gaussian.srun` job script has three main sections:

__setup__  
Copy input and checkpoint file (if it exists) to the local temp
directory of the node. This will save the node from having to periodically write
checkpoint file updates to the user's home directory. Which means that,
depending on the server's hardware archicture, saving checkpoint files will be
done locally rather than remotely which saves time.

__main__  
Calculations are performed entirely in the local temp directory.

__teardown__  
Opposite of `setup`, checkpoint and any output files are copied
back to the user's home directory. This function is triggered via a `trap`
statement which ensures its execution even if the job is terminated early.
