#!/bin/bash
#SBATCH -J Ablation_ddpm
#SBATCH -N 1
#SBATCH -n 3
#SBATCH --gres=gpu:3
#SBATCH --time=6-23:59:59
#SBATCH --mail-type=END
#SBATCH --mail-user=tmo0005@mix.wvu.edu
#SBATCH --partition=community

module load lang/gcc/12.2.0
module load mpi/openmpi/4.1.5_gcc122
source /shared/software/conda/etc/profile.d/conda.sh
conda activate torch-env
cd $SCRATCH/Ablation_paper/SeisSegDiff

bash scripts/ddpm/train_interpreter.sh $1 F3

conda deactivate