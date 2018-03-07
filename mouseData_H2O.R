#Here I find the urlPath of the mouse on my system
#Then I upload that csv file to the h2o directory
mousePath = "https://raw.githubusercontent.com/kling111/Bioinformatics-GTC/master/mouse1_data.csv"
mouse.hex = h2o.importFile(path = mousePath)

#The anyFactor() function helps us figure out if there are any columns in the file that contain categorical data
h2o.anyFactor(mouse.hex)

#This allows us to view the data, now in a 5-number summary.
options(warn=-1)
summary(mouse.hex)
options(warn=0)

#This function creates a more specific quantile number summary
quantile(x = mouse.hex$C3, na.rm = TRUE)

#This h2o function creates a histogram from a file's given factor, in this case sepal_len
h2o.hist(mouse.hex$C3)
#However, in this case it's better to use the log10() of the mouse data's frequencies
h2o.hist(log10(mouse.hex$C3))



