#Import Data
sat <- read.csv("sat.csv")

#Preview Data
str(sat)
head(sat)
#ANOVA is a continuous measure
#ANOVA a t-test with more than one group
#Column names are the GPA levels

colnames(sat) <- c("3.51-4.0", "3.0-3.5", "0-2.99")
summary(sat)


#Have to fit a linear model to it. 
#Predict SAT Score based on group
#Want to predict SAT based on GPA group
#Assumption: Data is normal
#ANOVA robust against non-normality

#Preview Distribution
hist(sat[,1]) #Normal
hist(sat[,2]) #Slightly Uniform
hist(sat[,3]) 


scores1 <- c(sat[,1])
scores2 <- c(sat[,2])
scores3 <- c(sat[,3])

scores <- c(scores1, scores2, scores3)
names <- c(rep("A", length(sat[,1])), rep("B", length(sat[,2])), rep("C", length(sat[,3])))
  
#Create ANOVA Dataframe
df <- data.frame(scores, names)

#Box Plot of data
boxplot(df$scores ~factor(names))


#Buil ANOVA model
model <- aov(scores ~ names, data = df)
summary(model)

#p-value tells me if there is some significance between groups
#F-test tells me that something in the model is good
#But not what, we need to figure out what is good.
#Post-hoc test to see what exactly is "good"
#Tukey Post hoc test

posthoc <- TukeyHSD(x=model, "names", conf.level = 0.95, data = df)


