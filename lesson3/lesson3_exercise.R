# Week 3 Lesson: Explore One Variable
# Trying to reinstall packege 'ggplot2', 4 steps
remove.packages(c("ggplot2","data.table"))
install.packages('Rcpp',dependencies = TRUE)
install.packages('ggplot2',dependencies = TRUE)                
install.packages('data.table',dependencies = TRUE)

library(ggplot2) #must load the ggplot package first
data(diamonds) #loads the diamonds data set since it comes with the ggplot package
summary(diamonds)
?diamonds

hist(diamonds$price)
summary(diamonds$price)

# a) How many diamonds cost less thatn $500?
dia500 <- diamonds[diamonds$price < 500,]
dia250 <- diamonds[diamonds$price < 250,]
dia15000 <- diamonds[diamonds$price >= 15000,]

# Explore the largest peak in the
# price histogram you created earlier.

# Try limiting the x-axis, altering the bin width,
# and setting different breaks on the x-axis.

# There won't be a solution video for this
# question so go to the discussions to
# share your thoughts and discover
# what other people find.

# You can save images by using the ggsave() command.
# ggsave() will save the last plot created.
# For example...
#                  qplot(x = price, data = diamonds)
#                  ggsave('priceHistogram.png')

# ggsave currently recognises the extensions eps/ps, tex (pictex),
# pdf, jpeg, tiff, png, bmp, svg and wmf (windows only).

# Submit your final code when you are ready.
qplot(x = price, data = diamonds, binwidth = 1) +
  scale_x_continuous(limits = c(0,2000))
ggsave('priceHistogram.png')

# Break out the histogram of diamond prices by cut.

# You should have five histograms in separate
# panels on your resulting plot.

# TYPE YOUR CODE BELOW THE LINE
# ======================================================
install.packages('gridExtra')
library(gridExtra)
p1 <- qplot(x = price, data = subset(diamonds,cut == 'Fair'),
            xlab = 'Price ($)', ylab = 'Number of Diamonds', main ='Diamond Cut of Fair')
p2 <- qplot(x = price, data = subset(diamonds,cut == 'Good'),
            xlab = 'Price ($)', ylab = 'Number of Diamonds', main ='Diamond Cut of Good')
p3 <- qplot(x = price, data = subset(diamonds,cut == 'Very Good'),
            xlab = 'Price ($)', ylab = 'Number of Diamonds', main ='Diamond Cut of Very God')
p4 <- qplot(x = price, data = subset(diamonds,cut == 'Premium'),
            xlab = 'Price ($)', ylab = 'Number of Diamonds', main ='Diamond Cut of Premium')
p5 <- qplot(x = price, data = subset(diamonds,cut == 'Ideal'),
            xlab = 'Price ($)', ylab = 'Number of Diamonds', main ='Diamond Cut of Ideal')
grid.arrange(p1, p2, p3, p4, p5, ncol = 1)

by(diamonds$price,diamonds$cut,summary)


# In the two last exercises, we looked at
# the distribution for diamonds by cut.

# Run the code below in R Studio to generate
# the histogram as a reminder.

# ===============================================================

qplot(x = price, data = diamonds) + facet_wrap(~cut)

# ===============================================================

# In the last exercise, we looked at the summary statistics
# for diamond price by cut. If we look at the output table, the
# the median and quartiles are reasonably close to each other.

# diamonds$cut: Fair
#    Min. 1st Qu.  Median    Mean 3rd Qu.    Max. 
#     337    2050    3282    4359    5206   18570 
# ------------------------------------------------------------------------ 
# diamonds$cut: Good
#    Min. 1st Qu.  Median    Mean 3rd Qu.    Max. 
#     327    1145    3050    3929    5028   18790 
# ------------------------------------------------------------------------ 
# diamonds$cut: Very Good
#    Min. 1st Qu.  Median    Mean 3rd Qu.    Max. 
#     336     912    2648    3982    5373   18820 
# ------------------------------------------------------------------------ 
# diamonds$cut: Premium
#    Min. 1st Qu.  Median    Mean 3rd Qu.    Max. 
#     326    1046    3185    4584    6296   18820 
# ------------------------------------------------------------------------ 
# diamonds$cut: Ideal
#    Min. 1st Qu.  Median    Mean 3rd Qu.    Max. 
#     326     878    1810    3458    4678   18810 

# This means the distributions should be somewhat similar,
# but the histograms we created don't show that.

# The 'Fair' and 'Good' diamonds appear to have 
# different distributions compared to the better
# cut diamonds. They seem somewhat uniform
# on the left with long tails on the right.

# Let's look in to this more.

# Look up the documentation for facet_wrap in R Studio.
# Then, scroll back up and add a parameter to facet_wrap so that
# the y-axis in the histograms is not fixed. You want the y-axis to
# be different for each histogram.
? facet_wrap
qplot(x = price, data = diamonds) + facet_wrap(~cut, scales = "free_y")
# If you want a hint, check out the Instructor Notes.


# Create a histogram of price per carat
# and facet it by cut. You can make adjustments
# to the code from the previous exercise to get
# started.

# Adjust the bin width and transform the scale
# of the x-axis using log10.

# Submit your final code when you are ready.

# ENTER YOUR CODE BELOW THIS LINE.
# ===========================================================================
qplot(x = price/carat, data = diamonds, binwidth = 0.01) + facet_wrap(~cut, scales = "free_y")+
  scale_x_log10()

# Investigate the price of diamonds using box plots,
# numerical summaries, and one of the following categorical
# variables: cut, clarity, or color.

# There won't be a solution video for this
# exercise so go to the discussion thread for either
# BOXPLOTS BY CLARITY, BOXPLOT BY COLOR, or BOXPLOTS BY CUT
# to share you thoughts and to
# see what other people found.

# You can save images by using the ggsave() command.
# ggsave() will save the last plot created.
# For example...
#                  qplot(x = price, data = diamonds)
#                  ggsave('priceHistogram.png')

# ggsave currently recognises the extensions eps/ps, tex (pictex),
# pdf, jpeg, tiff, png, bmp, svg and wmf (windows only).

# Copy and paste all of the code that you used for
# your investigation, and submit it when you are ready.
# =================================================================
by(diamonds$price,diamonds$clarity,summary)
qplot(x = color, y = price, data = diamonds,
      geom = 'boxplot', 
      xlab = 'Color of Diamonds', ylab = 'Price of the diamonds') +
  coord_cartesian(ylim = c(0,8000))
ggsave('priceBoxplot.png')

by(diamonds$price,diamonds$color,summary)
IQR(subset(diamonds, color == 'D')$price)
IQR(subset(diamonds, color == 'J')$price)

# Investigate the price per carat of diamonds across
# the different colors of diamonds using boxplots.

# Go to the discussions to
# share your thoughts and to discover
# what other people found.

# You can save images by using the ggsave() command.
# ggsave() will save the last plot created.
# For example...
#                  qplot(x = price, data = diamonds)
#                  ggsave('priceHistogram.png')

# ggsave currently recognises the extensions eps/ps, tex (pictex),
# pdf, jpeg, tiff, png, bmp, svg and wmf (windows only).

# Copy and paste all of the code that you used for
# your investigation, and submit it when you are ready.

# SUBMIT YOUR CODE BELOW THIS LINE
# ===================================================================
qplot(x = color, y = price/carat, data = diamonds,
      geom = 'boxplot', 
      xlab = 'Color of Diamonds', ylab = 'Price per Carat of the diamonds') +
  coord_cartesian(ylim = c(1000,6000))
ggsave('pricepercaratBoxplot.png')

# Investigate the weight of the diamonds(carat) using a frequency polygon.
# Use different bin widths to see how the frequency polygon changes.
# What carat size has a count greater than 2000?
qplot(x = carat, y = ..count..,
      data = diamonds, binwidth = 0.01,
      geom = 'freqpoly') +
  scale_x_continuous(limits = c(0,2.5),breaks = seq(0, 2.5, 0.1))
ggsave('caratFreqpoly.png')


# The Gapminder website contains over 500 data sets with information about
# the world's population. Your task is to download a data set of your choice
# and create 2-5 plots that make use of the techniques from Lesson 3.

# You might use a simple histogram, a boxplot split over a categorical variable,
# or a frequency polygon. The choice is yours!

# You can find a link to the Gapminder website in the Instructor Notes.

# Once you've completed your investigation, create a post in the discussions that includes:
#       1. any questions you answered, your observations, and summary statistics
#       2. snippets of code that created the plots
#       3. links to the images of your plots

# You can save images by using the ggsave() command.
# ggsave() will save the last plot created.
# For example...
#                  qplot(x = price, data = diamonds)
#                  ggsave('priceHistogram.png')

# ggsave currently recognises the extensions eps/ps, tex (pictex),
# pdf, jpeg, tiff, png, bmp, svg and wmf (windows only).

# Copy and paste all of the code that you used for
# your investigation, and submit it when you are ready.
# ====================================================================================
ageofmarriage <- read_excel("GitHub/DataAnalysiswithRUdacity/lesson3/indicator age of marriage.xlsx")
hist(ageofmarriage$`2005.0`,
     xlab='Age of First Marriage, collected in 2005', 
     ylab = 'Frequency', 
     main = 'Histogram of Age of First Marriage')
#ggsave('Women1stMarriageAge2005Histogram.png')

qplot(x = 1975.0, y = ..count../sum(..count..),
      data = ageofmarriage, binwidth = 10,
      geom = 'freqpoly') +
  scale_x_continuous(limits=c(1770,2005))

BMI_female <- read.csv("GitHub/DataAnalysiswithRUdacity/lesson3/indicator_BMI female ASM.csv", check.names = F, 1)
# SBP_female <- read.csv("GitHub/DataAnalysiswithRUdacity/lesson3/Indicator_SBP female ASM.csv", check.names=FALSE)
# TC_female <- read.csv("GitHub/DataAnalysiswithRUdacity/lesson3/Indicator_TC female ASM.csv", check.names=FALSE)
# Breast_Death_female <- read.csv("GitHub/DataAnalysiswithRUdacity/lesson3/indicator breast female mortality.csv", check.names=FALSE)

hist(BMI_female$'2000',
     xlab = 'Female BMI in 2000',
     ylab = 'Female BMI',
     main = 'Histogram of Female BMI in 2000')
qplot(x = '2005', y = ..count../sum(..count..),
      data = BMI_female,
      geom = 'freqpoly')

