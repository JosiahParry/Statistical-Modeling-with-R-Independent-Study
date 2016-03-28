News <- read.csv("MashableNewsPopularity.csv")
str(News)
dim(News)

#Reducing Variables
#Create New Data Frame
news2 <- News[,c(3:15,38)]
#Create Initial Model
model <- lm(news2$shares ~., data = news2)
#Print Summary Statistics
summary(model)

#Remove Lifestyle
News3 <- news2[,c(1:8,10:14)]
#Create New Model w/out Lifestyle
model2 <- lm(News3$shares ~., data = News3)
#print summary statistics
summary(model2)


#Remove Social Media
News4 <- News3[, c(1:10, 12,13)]
#Model w/out Lifestyle and Social Media
model3 <- lm(News4$shares ~., data = News4)
summary(model3)

#Remove Business
News5 <- News4[,c(1:9,11,12)]
#Model without Lifestyle and Social Media & Business
model4 <- lm(News5$shares ~., data = News5)
summary(model4)


#Remaining variables are all effective predictors of number of shares, in entirty is eplaining very little

