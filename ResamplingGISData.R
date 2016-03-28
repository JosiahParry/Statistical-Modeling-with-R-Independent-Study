

#Resampling 
NewName <- as.character(is.na(seq(1,50,1)))
NewUnemployment <- sample(WorkingTable$Unemployment, size = 50, replace = FALSE)
NewGini <- sample(WorkingTable$Gini_Coefficient, size = 50, replace = FALSE)
NewHighSchool <- sample(WorkingTable$HighSchool, size = 50, replace = FALSE)
NewCollege <- sample(WorkingTable$Bachelors, size = 50, replace = FALSE)
NewWhite <- sample(WorkingTable$Percent_White, size = 50, replace = FALSE)
NewMinority <- sample(WorkingTable$Minority, size = 50, replace = FALSE)

NewData <- data.frame(NewName, NewUnemployment, NewGini, NewHighSchool, NewCollege, NewWhite, NewMinority)
colnames(NewData) <- c(colnames(WorkingTable))

MergedDF <- rbind(WorkingTable, NewData)
head(MergedDF)
tail(MergedDF)

for(i in 2:7) {
  hist(MergedDF[,i])
}


rnorm()