# auto_slurm

The purpose of this repo is to simplify setup and submission of SLURM jobs. This 
script is currently designed to run SLURM jobs doing [gaussian](http://gaussian.com/running/) 
or [gamess](https://www.msg.chem.iastate.edu/gamess/) calculations. If you are interested in 
how the scripts work, see the [README](scripts/README.md) in the scripts section.

# Installing the script

1. Login to the server used to submit SLURM jobs.
2. Clone this repo using the following command:
```
git clone https://github.com/CurtisColwell/auto_slurm.git
```

# Running the script

For gaussian, simply place gaussian input (.inp) files in the `auto_slurm/gaussian/input/` 
directory and run the script using the following command.
```
bash auto_slurm/gaussian/scripts/submit_gaussian.bash
```
A test input file of a hydrogen molecule is included. Run this first to ensure
everything is working properly. Output, checkpoint and formatted checkpoint
files will be generated in the output directory. A log showing the steps
performed by the script will be available in the log directory.

### Running gamess

Follow the instructions for gaussian, but replace every mention of "gaussian" 
with "gamess". Gamess does not generate checkpoint, formatted checkpoint, or 
log files. The text normally generated in the log file for gaussian submissions 
instead appears at the beginning and end of the output file.

### Running on different nodes

If your job needs more time, you can run on a different node. The default node is 'short' 
which has a 24 h time limit. Switching to 'long' changes the time limit to 2 weeks. A full 
list of nodes can be found [here](https://hpcrcf.atlassian.net/wiki/spaces/TCP/pages/7285967/Partition+List).
To run on a different node add the name of the node at the end of the submission command. For 
example to run on a **long** node run the following command:
```
bash auto_slurm/scripts/submit_gaussian.bash long
```

### Note about input files

Do not place `%Chk=` directives at the top of the input file. Checkpoint files
are handled automatically by the script.

Limit input filenames to 8 characters. Otherwise, the script will resubmit jobs that are 
already running.
