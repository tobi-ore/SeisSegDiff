# SeisSegDiff
An efficient few-shot segmentation diffusion model for seismic facies classification

This code is based on [Label-Efficient Semantic Segmentation with Diffusion Models](https://arxiv.org/pdf/2112.03126.pdf) and [guided-diffusion](https://github.com/openai/guided-diffusion). 

**Note:** use **--recurse-submodules** when clone.

&nbsp;
## Publication
This work has resulted in 2 published papers in Computers & Geosciences: [SeisSegDiff: A label-efficient few-shot texture segmentation diffusion model for seismic facies classification](https://doi.org/10.1016/j.cageo.2024.105823) and [Evaluating key parameters impacting the performance of SeisSegDiff model for seismic facies classification](https://doi.org/10.1016/j.cageo.2024.105829). 

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


