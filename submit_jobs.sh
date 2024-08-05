#!/bin/bash

# Specify the path to the experiments folder
EXPERIMENTS_FOLDER="experiments/blk_stp_exp"

# Iterate over all JSON files in the folder
for json_file in "$EXPERIMENTS_FOLDER"/*.json; do
    # Extract the file name without the path
    # filename=$(basename -- "$json_file")
    
    # Submit the job using sbatch
    sbatch ddpm_SBATCH.sh "$json_file"
    
    # Optionally, add a delay between submissions to avoid overwhelming the system
    sleep 5
done