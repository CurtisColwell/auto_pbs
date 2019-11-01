#!/bin/bash
set -e

bash gaussian/scripts/submit_gaussian.bash $1
bash gamess/scripts/submit_gamess.bash $1
bash orca/scripts/submit_orca.bash $1