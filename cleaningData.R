library(rlist)
library(readxl)
Pool_1_CDR3_Results <- read_excel("~/Downloads/Chapes files/Pool 1 - CDR3 Results.xlsx", 
                                  col_names = FALSE)
View(Pool_1_CDR3_Results) #These lines of code were used to read in a excel file that contains AA Junctions with many duplicates

#Here, I take the csv file and format the sequence into a list format
#Pool_1_CDR3_Results is the name of the csv file, and X__1 is the column that contains the amino sequences
pool1 <- Pool_1_CDR3_Results$X__1

#creating a blank list
list1 <- list()

#looping through the list of my choice
for(num in pool1)
  {for(dos in num)
    {temp <- dos
    list1 <- list.append(list1, temp)
}
}

#creating a list from the one above with all unique values, no duplicates
list1 <- unique(list1)

#creating a blank AAStringSet, and filling it with the now unique sequences
pool1AA <- AAStringSet()
for(i in temp)
  {for(j in i)
    {u <- AAStringSet(j)
    pool1AA <- append(pool1AA, u)
}
}

print(pool1AA)
#from here you can make heatmaps of your data by going through the heatmap code 
#However, remember some datasets need their duplicates to make an accurate heatmap
#For example, the Chapes data does not have a frequency column, therefore the duplicated for that dataset are necessary.
#In the case of a dataset with no freqs, please use the heatmap_code_noFreq script.