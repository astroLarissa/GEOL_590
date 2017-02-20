a <- 1
b <- 2
c <- a + b
  typeof(a)
  typeof(c)
  length(a)
  length(c)
  attributes(a)
  attributes(C)

set.seed(0)  #This ensures that all the 'random' numbers will be the same, i.e. reproducible.

d <- rnorm(20) #double vector, length 20, no attributes
e <- rnorm(20) 
f <- d + e

attributes(d)
attributes(e)
length(f)
attributes(f)

g <- rnorm(5)
is.vector(g)
print(g)
attr(g, "my_attribute") <- "This vector has two nonnegative values."
str(attributes(g))
attr(g, "my_attribute_2") <- "Data taken 1/24/17 at 14:40"

#1. date, time, author stamps for data collection
#2. if using RNG, what seed setting? to get same set of RNG's every time
#3. side-by-side outline and execution (right word?) of algorithm or heading for subroutines so logic easy to follow

#2.2.2 What happens to a factor when you modify its levels?
# You change what inputs are valid. 
#Def: Factor: a vector that can contain only pre-defined values, categorical data

f1 <- factor(letters) #returns letters z-a
class(f1)        
levels(f1)
levels(f1) <- rev(levels(f1)) #This reverses the factors. 
class(f1)
levels(f)

dim(g) ##Q2.3.1.1NULL beacuse because it is a one-dimensional vector. It has length. Dimensions are extra attributes applied to a vector to turn it into a matrix or a higher dimensional array:
attributes(mtcars) ##Q2.4.5.1 A dataframe's attributes are names (columns), row names, and class. Names, dimensions, class.
#mtcars <- as.matrix(mtcars) ##Q2.4.5.2 It changes a dataframe into a matrix and coerces the data type.
is.matrix(mtcars) ##playing with as.matrix()
DF <- data.frame(a=1:5,b=6:10)
as.matrix(DF)
is.matrix(DF)
zero <- data.frame (a=numeric(0),b=numeric(0)) ##2.4.5.3: Can you have a data frame with 0 rows? What about 0 columns?
attributes(zero)
print(zero) ##Yes, zero rows are possible.
yikes <- data.frame()
print(yikes) ##Zero rows and zero columns possible!


plate_reader <- read.csv("2016_10_11_plate_reader.csv", skip = 33)
print(plate_reader)
str(plate_reader)
install.packages("dplyr", repos = c(CRAN="https://cran.r-project.org/"))  
library("tidyverse")
read_csv("2016_10_11_plate_reader.csv", skip = 33)   #using tidyverse

print(mtcars)
nrow(mtcars)      #This will return the number of rows
length(mtcars)    #This will return the number of rows
ncol(mtcars)      #This will return the number of columns
is.matrix(mtcars) #No, it's a dataframe! It's a nested list. Heterogeneous data types.
str(mtcars)

cylind <- data.frame(mtcars$cyl) #select column 'cyl' from mtcars using 
cylind_2 <- subset(mtcars, select = c("cyl")) #Select column 'cyl' from mtcars using subset()
cylind_3 <-mtcars['cyl'] #Select column 'cyl' using []
cylind_values <- mtcars$cyl
hylt <- mtcars[mtcars$wt<3|mtcars$wt>4,]  #all the columns of mtcars, but only with cars that weigh less than 3.0 OR more than 4.0wt_mpg <- subset[mtcars, select = c('wt','mpg')]
wt_mpg <- subset(mtcars, select = c('wt','mpg')) #only columns wt and mpg
wt_mpg_2 <- mtcars[,c('mpg','wt')] #only columns wt and mpg
med_mpg <- mtcars$mpg == median(mtcars$mpg)  #Which cars w/ mpg equal to the median gas mileage for the set? (Use median and which).s
which(med_mpg)
which(mtcars$mpg == median(mtcars$mpg))  #Which cars w/ mpg equal to the median gas mileage for the set? (Use median and which).s

#rownames(mtcars)[c(1,4,31)]


#mtcars[mtcars$cyl = 4, ] # Trying to create a data frame of cars with 4 cylinders only
mtcars[mtcars$cyl == 4, ] # Trying to create a data frame of cars with 4 cylinders only
#mtcars[5:32, ]
mtcars[-1:-4, ]  #drop rows 1-4
#mtcars[mtcars$cyl <= 5]
mtcars[mtcars$cyl <= 5,]
#mtcars[mtcars$cyl == 4 | 6, ] # The | is an 'or' operator - you want a data frame of cars with 4 OR 6 cylinder engines
mtcars[mtcars$cyl == 4 | mtcars$cyl == 6, ] # The | is an 'or' operator - you want a data frame of cars with 4 OR 6 cylinder engines

