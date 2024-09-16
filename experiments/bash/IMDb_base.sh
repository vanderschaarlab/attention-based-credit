#!/bin/bash

# Get the directory of the current script
SCRIPT_DIR=$(dirname "$(realpath "$0")")
SCRIPT="$SCRIPT_DIR/../scripts/rlhf_imdb.py"

for i in {1..10}; do
    # Run each method 10 times
    for method in rlhf abc uniform abcde abcde2; do
        echo "Run $i for method $method"
        python $SCRIPT --method $method --beta 0.8 --project_name IMDb_seeded --batch_size 16 --max_epochs 150 --seed $i
    done
done
