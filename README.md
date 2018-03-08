# Bioinformatics-GTC
GTC project 

Overview of Files in this Repository:

heatmap_code.R - An R Script that was used to create the heatmaps you see in this repository. mouse1_data.csv was used to create the heatmaps in this R Script, however, the code can be tweaked to create heatmaps of any CSV file with amino acid sequences and frequencies. 

heatmap_code_noFrep.R - This R Script is different because it doesn't take into account frequencies of AA junctions. This R Script would mainly be used in datasets that contain unique AA junctions without relative frequencies or contain a long list of AA junctions with duplicates that account for frequency i.e. Chapes Data.

cleaningData.R - This R Script was used to removed duplicate sequences and create a more concise csv file. This script should only be used in conjunction with heatmap_code.R, as duplicated may be necessary to create a heatmap if a dataset does not contain the relative frequencies for each AA junction.

mouseData_H2O.R - This R Script highlights a few simple statements in H2O that set up the mouse1_data.csv for further analysis using H2O's deep learning technologies.

IgH Compiled CDR3 AAs (All individuals) (1).xlsx, Pool 1_CDR3 Results, mouse1_data.csv are the datasets used in this project. IgH contains the complete AA sequences for all mouse individuals, while mouse1_data contains the amino acid sequences for only the first mouse in IgH. Pool 1_CDR3 Results contains the data collected by Chapes Lab. It contains AA Junctions, however, no relative frequencies, therefore the duplicates in this case are vital to creating an accurate heatmap.


