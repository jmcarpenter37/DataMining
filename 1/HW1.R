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

# 
Elite=rep("No",nrow(college))
Elite[college$Top10perc>50]="Yes"
Elite=as.factor(Elite)
college=data.frame(college,Elite)

summary(college)

plot(college$Private,college$Outstate)

# Use hist to produce some histograms
par(mfrow=c(2,2))
hist(college$Books)
hist(college$Room.Board)
hist(college$Grad.Rate)

# Continue exploring the data and see what you find 

