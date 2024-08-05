#!/bin/sh
#PBS -N Seis_Facies
#PBS -l nodes=1:ppn=2:gpus=3,walltime=24:00:00
#PBS -l epilogue=$SCRATCH/SeisSegDiff/run_echo.sh
#PBS -m ae
#PBS -M tmo0005@mix.wvu.edu
#PBS -q comm_gpu_week
#PBS -o run_results.out

module load parallel/openmpi/3.1.6_gcc48
source /shared/software/conda/conda_init.sh
conda activate torch-env
cd $SCRATCH/SeisSegDiff
bash scripts/ddpm/train_interpreter.sh experiments/F3/ddpm.json F3
bash scripts/ddpm/train_interpreter.sh Pari 

conda deactivate

