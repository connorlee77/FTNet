#!/bin/sh
MODEL=ftnet
BACKBONE=resnext50_32x4d
GPUS=1
FILTERS=128
EDGES='3'
NBLOCKS=2
NODES=1
ALPHA=20


## FineTuning
DATASET2='cartd'
RUNDIR2=/home/connor/repos/FTNet/connors_run
mkdir -p "$RUNDIR2"

python  ./../lightning_scripts/main.py \
--mode 'train' \
--train_only False \
--no-of-filters "$FILTERS" \
--num-blocks "$NBLOCKS" \
--edge-extracts "$EDGES" \
--loss-weight "$ALPHA" \
--model "$MODEL" \
--pretrain-checkpoint /home/connor/repos/FTNet/weights/ckpt/last.ckpt \
--pretrained-base False \
--backbone "$BACKBONE" \
--dataset "$DATASET2" \
--dataset-path '/home/connor/repos/split_thermal_custom/cartd' \
--base-size '640'  \
--crop-size '512' \
--train-batch-size 8 \
--val-batch-size 8 \
--test-batch-size 1 \
--epochs 100 \
--optimizer 'SGD' \
--lr 0.001 \
--scheduler-type 'poly_warmstartup' \
--warmup-iters 0 \
--warmup-factor 0.3333 \
--warmup-method 'linear' \
--save-images-as-subplots False \
--save-images False \
--debug False \
--workers 8 \
--momentum 0.9 \
--weight-decay 0.0001 \
--beta1 0.9 \
--beta2 0.999 \
--epsilon 1e-8 \
--seed 0 \
--gpus $GPUS \
--num-nodes $NODES \
--distributed-backend 'dp' \
--wandb-name-ext '' \
--save-dir "$RUNDIR2"


## Testing
# python  ./../lightning_scripts/main.py \
# --mode 'test' \
# --model "$MODEL" \
# --edge-extracts "$EDGES" \
# --loss-weight "$ALPHA" \
# --num-blocks "$NBLOCKS" \
# --backbone "$BACKBONE" \
# --no-of-filters "$FILTERS" \
# --test-monitor 'val_mIOU' \
# --test-monitor-path "$RUNDIR2"/ckpt/ \
# --pretrained-base False \
# --dataset "$DATASET2" \
# --dataset-path '/home/connor/repos/split_thermal_custom/cartd' \
# --test-batch-size 1 \
# --save-images True \
# --save-images-as-subplots False \
# --debug False \
# --workers 8 \
# --seed 0 \
# --gpus 1 \
# --num-nodes 1 \
# --distributed-backend 'dp' \
# --wandb-name-ext '' \
# --save-dir "$RUNDIR2"/Best_MIOU/
