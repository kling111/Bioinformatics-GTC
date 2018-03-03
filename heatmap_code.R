View(mouse1_data) #or any dataset name you want to make a heatmap out of.

aaVector <- AAStringSet()
holder <- AAStringSet()

# loops from first value to last value, creating a AAstringset of all sequences
# 2:8759 is specific for this dataset, in general it should be firstValue:lastValue.
for (num in 2:8759)
{
  holder = AAStringSet(mouse1_data$X2[num])
  
  aaVector = append(aaVector, holder)
  
}

consensusOriginal <- consensusMatrix(aaVector)
consensusFinal <- consensusMatrix(aaVector)

# switches the order of the rows from A to Y , Y to A
for(num in 1:nrow(consensusOriginal))
{
  consensusFinal[num, ] = consensusOriginal[nrow(consensusOriginal) - (num - 1), ]
}

logConsensus <- log10(consensusFinal)

# removes all the -Inf values from the log consensus
for(num in 1:nrow(consensusOriginal))
{
  for(sec in 1:ncol(consensusOriginal))
  {
    if(logConsensus[num, sec] == -Inf)
    {
      logConsensus[num, sec] = 0
    }
  }
}

#renames the row names to correspond to the correct amino acid.
row.names(logConsensus) <- c("Y","X","W","V","T","S","R","Q","P","N","M","L","K","I","H","G","F","E","D","C","A")

#creates a heatmap that scales by the row.
heatmap(logConsensus, Colv = NA, Rowv = NA, scale = "row", margins = c(5,10),
        xlab = "Position in Sequence", ylab =  "Amino Acid",
        main = "GeneLab")

#creates a heatmap that scales by the column.
heatmap(logConsensus, Colv = NA, Rowv = NA, scale = "col", margins = c(5,10),
        xlab = "Position in Sequence", ylab =  "Amino Acid",
        main = "GeneLab")