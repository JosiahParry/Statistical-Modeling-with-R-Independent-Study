acnt <- read.csv("AccountantSalary.csv")
library(dplyr)

str(acnt)
head(acnt)

anova = aov(BasePay ~ JobTitle, data = acnt)
summary(anova)

#plot ANOVA

plot(anova)
#need to do post hoc group comparisons
#Tukey Post-Hoc Test
posthoc <- TukeyHSD(x=anova, "JobTitle", conf.level = 0.95, data=acnt)

df <- data.frame(posthoc$JobTitle)

colnames(df) <- c("diff", "lwr", "upr", "padj")


boxplot(acnt$BasePay ~factor(acnt$JobTitle))
