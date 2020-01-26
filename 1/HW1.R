# 9. College dataset
college = read.csv("College.csv")

rownames(college)=college[,1]
fix(college) # Can confirm there is now a row.names column with the university names going down the column

# Eliminating the names column
college = college[,-1]
fix(college)

# Use the summary() func to produce a numerical summary of the variables in the data set
summary(college)

# use pairs function to produce a scatterplot matrix for the first 10 columns
pairs(college[,1:10])

# Use the plot functions to plot outstate vs private
plot(college$Private,college$Outstate,main="Private vs Out of State")
# We can see that the provate tuition is much higher

# 
Elite=rep("No",nrow(college))
Elite[college$Top10perc>50]="Yes"
Elite=as.factor(Elite)
college=data.frame(college,Elite)

summary(college)


# Use hist to produce some histograms
par(mfrow=c(2,2))
hist(college$Books,xlab="Books")
hist(college$Room.Board,xlab="Room and Board")
hist(college$Grad.Rate,xlab="Graduation Rate")

# Continue exploring the data and see what you find 
plot(college$PhD , college$Grad.Rate , xlab = "Number of PhD's",ylab="Graduation RAte")
# Here I was interested in looking to see if there was a higher
# trend in graduation rates when there were more PhDs. However,
# it appears that even in colleges where there are more PhD's
# It appear that from college's with approx 40 to college's 
# where there are approx 100 PhD's the grad rate is approx the
# same 
plot(college$PhD , college$Room.Board,"PhD Count vs Room and Board")

mean(college$PhD) # The mean percent of faculy with PhD's is 72.66023
mean(college$Room.Board) # The mean Room and board cost is 4357.526
# 10. Boston housing data set

library(MASS)
Boston
?Boston
# How many rows are in this datasets? Contains 506 rows

# How many columns are in this dataset? Contains 14 rows

# What do the columns and rows represent?
# The Boston dataset contains information about the 
# housing in Boston. It was used originially
# to predict nox levels and to also predict 
# the median value of a home.
# See: https://www.cs.toronto.edu/~delve/data/boston/bostonDetail.html

# The columns contain the variables:
#CRIM - per capita crime rate by town
#ZN - proportion of residential land zoned for lots over 25,000 sq.ft.
#INDUS - proportion of non-retail business acres per town.
#CHAS - Charles River dummy variable (1 if tract bounds river; 0 otherwise)
#NOX - nitric oxides concentration (parts per 10 million)
#RM - average number of rooms per dwelling
#AGE - proportion of owner-occupied units built prior to 1940
#DIS - weighted distances to five Boston employment centres
#RAD - index of accessibility to radial highways
#TAX - full-value property-tax rate per $10,000
#PTRATIO - pupil-teacher ratio by town
#B - 1000(Bk - 0.63)^2 where Bk is the proportion of blacks by town
#LSTAT - % lower status of the population
#MEDV - Median value of owner-occupied homes in $1000's
fix(Boston)

# Make pariwise scatterplots of the predcitors. 
# Describe your findings
pairs(Boston)
cor(Boston) #interesting correlation matrix! 
# Lets take two instances here based on the scatter plots alone.
# If we are predicting crime then based on the scatterplot
# we are hard-pressed to find any variables that are 
# correlated with crime. 

# Doesn't appear to be any predictors associated
# wth crimerate

# There appear to be suburbs with crime rates that range from 
# .00632 to nearly 89.

# Tax rates is from 187 to 711 Per $10k

# Pupil teacher ratio from 12.6 to 20 

# How many suburbs bound the charles river?
nrow(Boston[Boston$chas==1,])
# There are 35 suburbs

# What is the median pupil-teacher ration among the towns in this dataset?
median(Boston$ptratio)
# 19.05

# Observations 399 and 406 contain the lowest MEDV values at 5.0

# In this data set, how many of the suburbs average more than seven rooms per dwelling?
nrow(Boston[Boston$rm > 7,]) # 64 suburbs average more than seven rooms per dwelling

# More than 8
nrow(Boston[Boston$rm > 8,]) # 13 suburbs average more than seven rooms per dwelling

# Comment on the suburbs that average more than eight rooms per dwelling
summary(Boston[Boston$rm > 8,])
# We can see that the crime rate is low(with an average of ~ .72)
# We can also see that in these suburbs that nox levels are low as well(the average is ~ .54)
# More than likely these are neighborhoods that could 
# contain alot of wealth


