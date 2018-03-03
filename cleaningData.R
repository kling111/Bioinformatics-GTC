library(rlist)

#here, I take the csv file and format the sequence into a list format
#Pool_1_CDR3_Results is the name of the csv file, and X__1 is the column that contains the amino sequences
pool1 <- Pool_1_CDR3_Results$X__1
#creating a blank list
temp <- list()

#looping through the list of my choice
for(i in pool1)
  {for(j in i)
    {u <- j
    temp <- list.append(temp, u)
}
}

#creating a list from the one above with all unique values, no duplicates
temp <- unique(temp)

#creating a blank AAStringSet, and filling it with the now unique sequences
pool1AA <- AAStringSet()
for(i in temp){for(j in i){u <- AAStringSet(j)
pool1AA <- append(pool1AA, u)
}
}

pool1AA

#from here you can make heatmaps of your data by going through the heatmap code 
#starting from the consensusMatrix steps.