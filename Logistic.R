#Logistic Regression

#Import
df <- read.csv("seg-large.csv")

#Look at Data
head(df)
tail(df)
str(df)
summary(df)
#Want to predict boundary

hist(df$sv)
hist(df$rh)

#want at least 10% of each T/F ***rule of thumb for logistic***


#Creating Dummy Variables ***look up way to do this in DPLYR
df$response <- rep(0, dim(df)[1])

for (i in 1:dim(df)[1]) {
    if(df$boundary[i] == "TRUE") {
      df$response[i] = 1
    }
}


#Do the logit 
#use glm()
#can set data = "blank.csv" to avoid "df$variable"
#binomial = 0 / 1 response 
fit <- glm(df$response ~ df$pmi + df$sv + df$h + df$rh,
           family = binomial(link="logit"))
summary(fit)


#Residual Deviance
# how different the predicition would be from the actual value
#Null deviance with only an intercept, so no predictors
# [row, column] OR [x,y]





