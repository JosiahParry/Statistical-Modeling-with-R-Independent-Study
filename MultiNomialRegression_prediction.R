require(foreign)
require(nnet)
require(ggplot2)
require(reshape2)

#nnet has multinomial function
#relevel orders based on a basecase / reference setting (ref)

#load data
ml <- read.dta("http://www.ats.ucla.edu/stat/data/hsbdemo.dta")
#Creating new program variable where the reference is "academic"
ml$prog2 <- relevel(ml$prog, ref = "academic")

#creating multinomial model
test <- multinom(prog2 ~ ses + write + math, data = ml)
summary(test)


#I need to calculate p values
#Creating Z values
z <- summary(test)$coefficients/summary(test)$standard.errors

#The normal distribution is greater than 
p <- (1 - pnorm(abs(z), 0, 1))*2
p

#pp = proportions 
head(pp <- fitted(test))

#create fake DF with constant variable to see how probability changes by SES
df <- data.frame(ses = rep(c("low", "middle", "high"), each = 41),
                 write = rep(c(30:70),3),
                 math = rep(c(30:70),3))

#predicted values based on faux DF (created from original)
predict(test, newdata = df, type = "probs", se = TRUE)
#test is based off of ML data
#newdata is used to predict BASED off of the ML data
#newdata is used in fitting formula 
#newdata is how I would do my accuracy assessment (if i knew their outcomes)

#with more dimensions I need more data to do my predictions, we only have 200 here
#model complexity is based off of nrow in training set


#Real life example of how this would work
#Ex. examining potential students at an  school
#IF i were to recieve new values from potential students
#i could throw their info into our model and see their probabilities of being put into academic / general / vocational
