library(readr)
data <- read_csv("~/Documents/My Documents/Bioinformatics proj/mouse1_data.csv") #You may have to change this to find the csv.file in your system
View(data) #mouse1_data is an example, any dataset that is formatted with amino sequences and relaive frequencies can use this code.
#Alternatively, you can also use the import dataset button under the environment tab in RStudio, which would provide the same function as the code above.

freqMatrix <- c()
freqArray <- c()
count <- 0

# loops from first value to last value, creating a Frequency Matrix of how often certain amino acids occur in their relative positions. 
# 2:8759 is specific for this dataset, in general it should be firstSequence:lastSequence.

for(len in 1:25) #25 is the longest length of a sequence in the mouse data
{
  for (amino in c("Y","X","W","V","T","S","R","Q","P","N","M","L","K","I","H","G","F","E","D","C","A"))
  {
    for(num in 2:8759)
    {  
      if(substr(data$X2[num], len, len) == amino)
      {
        count = as.double(data$X3[num]) + count
      }
    }
    freqArray <- append(freqArray, count)
    count <- 0
  }
  freqMatrix <- cbind(freqMatrix, freqArray)
  freqArray <- c()
}

#renames the row names to correspond to the correct amino acid.
row.names(freqMatrix) <- c("Y","X","W","V","T","S","R","Q","P","N","M","L","K","I","H","G","F","E","D","C","A")
colnames(freqMatrix) <- c(1:25)
#creates a heatmap that scales by the row.
heatmap(freqMatrix, Colv = NA, Rowv = NA, scale = "row", margins = c(5,10),
        xlab = "Position in Sequence", ylab =  "Amino Acid",
        main = "GeneLab")

#creates a heatmap that scales by the column.
heatmap(freqMatrix, Colv = NA, Rowv = NA, scale = "col", margins = c(5,10),
        xlab = "Position in Sequence", ylab =  "Amino Acid",
        main = "GeneLab")