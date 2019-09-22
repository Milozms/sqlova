#!/usr/bin/env bash
# FILENAME:  run.sh
#PBS -q maosen
#PBS -l nodes=1:ppn=1:gpus=1
#PBS -l walltime=12:00:00
cd /home/maosen/sqlova
module load anaconda/5.1.0-py36
mkdir ./smalls/run-$RID
python split_data.py $SEED $RID
python train_small.py --fine_tune --seed $SEED --run_id $RID --log_file log-small-constr-run-$RID