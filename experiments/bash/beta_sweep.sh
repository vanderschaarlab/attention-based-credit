#!/bin/bash

# Get the directory of the current script
SCRIPT_DIR=$(dirname "$(realpath "$0")")
SCRIPT="$SCRIPT_DIR/../scripts/rlhf_imdb.py"

for i in {1..10}; do
    # Run each method 10 times
    for beta in $(seq 0 0.1 1); do
        echo "Running abc with beta=$beta"
        python $SCRIPT --method abc --beta $beta --project_name beta_sweep_seeded --batch_size 8 --seed $i --max_epochs 250
    done
done
