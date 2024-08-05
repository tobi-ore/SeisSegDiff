# SeisSegDiff
An efficient few-shot segmentation diffusion model for seismic facies classification

**currently underdevelopment**

This code is based on [Label-Efficient Semantic Segmentation with Diffusion Models](https://arxiv.org/pdf/2112.03126.pdf) and [guided-diffusion](https://github.com/openai/guided-diffusion). 

**Note:** use **--recurse-submodules** when clone.

&nbsp;
## Overview

The work investigates the use of diffusion models to enhance the generalization capabilities and accuracy of deep learning models for seismic facies segmentation.
![Workflow](https://github.com/user-attachments/assets/a38b60fc-d266-45a8-a075-ee5d449033d2)

&nbsp;

## Datasets

The evaluation is performed on 2 datasets: Pari and F3. These are popular open-source seismic datasets from New Zealand and the Netherlands respectively.
![Pari](https://github.com/user-attachments/assets/26fea84a-d348-4700-a5fe-3bd966216933)
The Parihaka data from New Zealand: (a) 3D seismic data, (b) facies labeled by expert interpreters, and (c) the percentage of individual facies in the data.

![F3](https://github.com/user-attachments/assets/ae185a79-2e00-43f5-b7e7-1dbbf8f10a35)
The F3 data from the Netherlands: (a) 3D seismic data, (b) facies labeled by expert interpreters, and (c) the percentage of individual facies in the data.

&nbsp;
## DDPM

### Pretrained DDPMs

The diffusion model trained on both Pari and F3 can be downloaded from [Tobi_model](https://drive.google.com/file/d/1ZLlF2p20C4FwiuCuGZJJ4_LCGLx9Q37U/view?usp=sharing).

### Run 

1. Download the datasets:\
 &nbsp;&nbsp;```bash datasets/download_datasets.sh```
2. Download the DDPM checkpoint:\
 &nbsp;&nbsp; ```bash checkpoints/ddpm/download_checkpoint.sh <checkpoint_name>```
3. Check paths in ```experiments/<dataset_name>/ddpm.json``` 
4. Run: ```bash scripts/ddpm/train_interpreter.sh <dataset_name>```
   
**Available checkpoint names:** lsun_bedroom, ffhq, lsun_cat, lsun_horse\
**Available dataset names:** bedroom_28, ffhq_34, cat_15, horse_21, celeba_19, ade_bedroom_30

**Note:** ```train_interpreter.sh``` is RAM consuming since it keeps all training pixel representations in memory. For ex, it requires ~210Gb for 50 training images of 256x256. (See [issue](https://github.com/nv-tlabs/datasetGAN_release/issues/34))

**Pretrained pixel classifiers** and test predictions are [here](https://www.dropbox.com/s/kap229jvmhfwh7i/pixel_classifiers.tar?dl=0).

### How to improve the performance

* Tune for a particular task what diffusion steps and UNet blocks to use.


&nbsp;
## DatasetDDPM


### Synthetic datasets

To download DDPM-produced synthetic datasets (50000 samples, ~7Gb) (updated 3/8/2022):\
```bash synthetic-datasets/ddpm/download_synthetic_dataset.sh <dataset_name>```

### Run | Option #1

1. Download the synthetic dataset:\
&nbsp;&nbsp; ```bash synthetic-datasets/ddpm/download_synthetic_dataset.sh <dataset_name>```
2. Check paths in ```experiments/<dataset_name>/datasetDDPM.json``` 
3. Run: ```bash scripts/datasetDDPM/train_deeplab.sh <dataset_name>``` 

### Run | Option #2

1. Download the datasets:\
 &nbsp;&nbsp; ```bash datasets/download_datasets.sh```
2. Download the DDPM checkpoint:\
 &nbsp;&nbsp; ```bash checkpoints/ddpm/download_checkpoint.sh <checkpoint_name>```
3. Check paths in ```experiments/<dataset_name>/datasetDDPM.json```
4. Train an interpreter on a few DDPM-produced annotated samples:\
   &nbsp;&nbsp; ```bash scripts/datasetDDPM/train_interpreter.sh <dataset_name>```
5. Generate a synthetic dataset:\
   &nbsp;&nbsp; ```bash scripts/datasetDDPM/generate_dataset.sh <dataset_name>```\
   &nbsp;&nbsp;&nbsp; Please specify the hyperparameters in this script for the available resources.\
   &nbsp;&nbsp;&nbsp; On 8xA100 80Gb, it takes about 12 hours to generate 10000 samples.   

5. Run: ```bash scripts/datasetDDPM/train_deeplab.sh <dataset_name>```\
   &nbsp;&nbsp; One needs to specify the path to the generated data. See comments in the script.

**Available checkpoint names:** lsun_bedroom, ffhq, lsun_cat, lsun_horse\
**Available dataset names:** bedroom_28, ffhq_34, cat_15, horse_21

&nbsp;
