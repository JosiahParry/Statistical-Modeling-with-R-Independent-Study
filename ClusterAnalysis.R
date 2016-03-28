cars <- mtcars

#measuring dissimilarity = cluster
d <- dist(as.matrix(cars))

#hierarchical

hc <- hclust(d)
plot(hc)


summary(hc)
#height determines diferent cluster based on what we think 
#is a good dissimilarity threshold
#wherever the abline crosses is a cluster

rect.hclust(hc, k = 8)
rect.hclust(hc, k = 4, border = 'blue')

#K-Means
fit <- kmeans(cars, 5)
aggregate(cars, by=list(fit$cluster), FUN = mean)
#if clustered, they are different

#append cluster info to data frame

clusteredcars <- data.frame(cars, fit$cluster)

library(ggvis)

clusteredcars %>% ggvis(~mpg, ~disp, fill = ~fit.cluster) %>% group_by(fit.cluster)


plot(clusteredcars$mpg, clusteredcars$disp, col = clusteredcars$fit.cluster, pch = 16, cex = 1.25)