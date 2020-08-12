
States=read.csv(file.choose(),sep=',',header=T)# Importing NA file

View(States)                               # Viewing Full Dataset
str(States)                                # Viewing Data Structure
summary (States)                           # Getting Brief Summary of Dataset
is.na(States)                              # Checking Data Have NA or not
nrow(States[!complete.cases(States),])     # Viewing only NA Data from Dataset

# ......................................REMOVING NAs......................................
S1=States       #Saving Data in other Variable to apply OMIT
View(S1[!complete.cases(S1),])         # Viewing only NA Data from Dataset
nrow(S1)                               # Total Rows in Dataset
nrow(S1[!complete.cases(S1),])         # Counting NA rows
S1=na.omit(S1)  # All NA rows will be omitted from dataset
nrow(S1)                               # Total Rows in Dataset will be now less 
nrow(S1[!complete.cases(S1),])         # 0 NA rows
View(S1)

#.......................................IMPUTING NAs......................................

#.......................................IMPUTING NAs......................................

# Imputing NAs Automatically
S4=States
View(S4)
S4=States                              # Saving Data in other Variable to impute NAs Manually
nrow(S4[!complete.cases(S4),])         # Check the STATE NAME AND COLUMNS with NA values
for(i in 1:ncol(S4))
{
S4[is.na(S4[,i]),i]=round(mean(S4[,i], na.rm = TRUE))
} 
nrow(S4[!complete.cases(S4),])         # Check the NAs left 
nrow(S4[complete.cases(S4),])          # Viewing Imputed Data
View(S4[])                             # Viewing Dataset

