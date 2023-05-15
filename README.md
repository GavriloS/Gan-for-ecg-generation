# Gan-for-ecg-generation

I created a Gan network to generate synthetic ECG signals in pytorch. To test the generated signals i used a network to classify ecg signals.

## Database

I used the MIT BIH database. The database consists of 48 30 minute ecg recordings sampled at 360 hz. I used the AAMI standard for heartbeat classification

## Denoising

For noise filtering i used a FIR filter implemented in matlab. The signals are then split into single heartbeats in python.

## Gan

I used a WGAN's to generate different types of arrhythmias. Detailed architecture is pictured below.

### Critic 

![](https://github.com/GavriloS/Gan-for-ecg-generation/blob/main/images/gan/critic.PNG)

### Generator

![](https://github.com/GavriloS/Gan-for-ecg-generation/blob/main/images/gan/generator.PNG)

## CNN

I implemented a CNN to measure the difference between an unbalanced dataset (without synthetic ECG signals) and a balanced dataset (with synthetic ECG signals)

### CNN architecture

![](https://github.com/GavriloS/Gan-for-ecg-generation/blob/main/images/cnn/CNN.PNG)

## Synthetic signals

### Class S
![](https://github.com/GavriloS/Gan-for-ecg-generation/blob/main/images/generate_images/Class_S.jpg)
### Class V
![](https://github.com/GavriloS/Gan-for-ecg-generation/blob/main/images/generate_images/Class_V.jpg)
### Class F
![](https://github.com/GavriloS/Gan-for-ecg-generation/blob/main/images/generate_images/Class_F.jpg)

## CNN Results 
