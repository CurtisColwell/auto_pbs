#!/bin/bash
set -e

bash gaussian/scripts/submit_gaussian.bash
bash gamess/scripts/submit_gamess.bash
bash orca/scripts/submit_orca.bash