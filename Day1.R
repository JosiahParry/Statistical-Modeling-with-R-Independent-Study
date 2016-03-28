f1 <- function(x,y) {
    x*y
}

#what is inside the bracket, whenever you call the function you have to put in an x and y
#take the first element then the second

f1(3,6)

f2 <- function(x){
  3*x
}

f2(5)

##the parenthesis is the value you input then the curly bracket is the function to preform
# return(c(x,y,z)) returns multiple functions at one
# f3 <- function(x,y) {
#  z1 <- x
# z2 <- x*y
#return(c(x,y,z))
#list(add = z1, sub = z2) # creating an array
# }


#creating sequences v1 <- seq(starting value, ending value, increment or length.out = x)
v1 <- seq(0,10,1)
v2 <- seq(0, 10, length.out = 1000)

#creating Random Normal Dist rnorm(#values to generate, mean = x, sd = 1)
normal <- rnorm(1000, mean = 0, sd = 1)

#exponential data always starts from +infinity to asymptotically close to 0
exponential <- rexp(1000, rate = 2)


#For Loop


