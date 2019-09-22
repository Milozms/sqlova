#!/usr/bin/env bash
# FILENAME:  run.sh
#PBS -l nodes=1:ppn=1:gpus=1
#PBS -l walltime=24:00:00
cd /home/maosen/sqlova
module load anaconda/5.1.0-py36
mkdir /home/maosen/sqlova/smalls/run-$RID
cp /home/maosen/sqlova/data/wikisql_tok/train* /home/maosen/sqlova/smalls/run-$RID
cp /home/maosen/sqlova/data/wikisql_tok/test* /home/maosen/sqlova/smalls/run-$RID
cp /home/maosen/sqlova/data/wikisql_tok/dev* /home/maosen/sqlova/smalls/run-$RID
python split_data.py $SEED $RID
python train-small.py --fine_tune --seed $SEED --run_id $RID --log_file log-small-constr-run-$RID