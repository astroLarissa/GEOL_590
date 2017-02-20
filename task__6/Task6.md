---
title: "Energy Usage and Production Among the 25 Largest Energy Economies"
output:
  html_document: default
  git_document: default
---


#Introduction

    There are a number of reasons to compare a nation's energy comsumption to its energy usage. To what extent do nations with high energy usage produce excess energy? How much is energy usage determined by its availability, i.e. the  production within a given nation. Of course, further analysis would be nessisary to determine the reason for the relationship of these two measures, and additional geographic data will help inform usage and production parameters.
    
#Methods and Results

The data comes from the US Central Intelligence Agency's Factbook published in 2014. Energy usage and production is measured in kilowatt-hours. 

```{r}
#Our first code segments will read in the data while assigning a column of country names, energy production, and energy usage using the readr and dplyr packages. 

#This code was origionally written and executed using base R and the function read.csv(), which resulted in enclosure of all entries [i:j] in quotes. Thus converting the energy values from strings to factors to numeric data type was impossible using standard protocol. 

#Steen identified and circumvented this idiosyncracy by deploying the tidyverse packages readr and dplyr.

library(readr)
library(dplyr)

#read_csv allows us to read in the data with column name assignnation. Note the 
#underscore '_' in this syntax compared with '.' in the base R syntax.

produse <- read_csv('project/produse.csv', col_names = c('country', 'production', 'usage'))

#We will now preview the data frame 'produse.' As you will be able to see, the 
#entries now have the proper data structure.
print(produse)

```


```{r}
#Our data is now ready to plot.

#We call tidyverse in order to make an initial test plot of our results.

library(tidyverse)

 ggplot(data = produse, aes(x = usage, y = production, label = country)) 	+
  #We will plot usage v. production. Specifying label = country allows us to see 
  #to want nation the data point corresponds. +
     ggtitle('Energy Production v. Usage in kWh') +
     geom_jitter() 										+
  #Visually organising the data as a scatterplot. 
     		theme(axis.text.x = element_text(
         						size=10, angle=45),
        		 axis.text.y = element_text( 
            					 size=10, angle=45)) 	+
   #Here we are tilting the axis values at 45 degrees to the plot while adjusting 
   #for label text size.
     geom_text(size=3)
   #This governs the text size of the country name labels. 
```

As clearly evidenced in the above plot, the top 3 energy economies are near half an order of magnitude larger than the next 22. 

Independent of the problem of label clutter, notwithstanding suppressing label overlap, this makes comparison among the smallest 19 energy economies impossible to visualize.

We seek to resolve this in two ways:

```{r}

#Using logarithmic scaling will allow us to better view that data of the lower production-usage energy economies and their relationships to one another.

#For reference on scaling methodology, please refer to:
#http://www.forbes.com/sites/naomirobbins/2012/01/19/when-should-i-use-logarithmic-scales-in-my-charts-and-graphs/3/#2747cea372ff

ggplot(data = produse, aes(x = usage, y = production, label = country)) 	+
     geom_jitter()                  +
      ggtitle('Energy Production v. Usage in kWh') +
      scale_x_log10()								+   #The addition of this code changes the
      scale_y_log10()    						+   #scale for each axis. 
     		theme(axis.text.x = element_text(
         						  size=10, angle=45),
        		 axis.text.y = element_text( 
            					size=10, angle=45)) 	+
     geom_text(size=3, angle = 315, hjust = 0,vjust = -.5, check_overlap = TRUE) 
    
#Now we will set check_overlap = TRUE to clean up label over-lapping. Given time, 
#I would do more research into adjusting individual label position.
#hjust nd vjust allow change of lable proximity and position to data point.
#angle allowed me to choose a label orientation that caused less intersection of
#lable with data point.

```

We see that the relationship of production and usage is close to an identity, which explains why, especially when compared with the graph below, logarithmic scaling does not immediately seem to sacrifice visual intuition for the data relationship. I would have liked to include via stat_function a plot of the identity function for reference, but have not mastered the arguments.

```{r}
#Our second method of rendering more intelligible the bottom 19 data points is to zoom in. 

p <-ggplot(data = produse[6:25,], aes(x = usage, y = production, label = country)) 	+
#storing our plot to 'p' will allow us to deploy zoom.   
     geom_jitter()                  +
      ggtitle('Energy Production v. Usage in kWh') +
    # scale_x_log10()								+   We will revert to linear scaling for now.
    # scale_y_log10()    						+ 
     		theme(axis.text.x = element_text(
         						  size=10, angle=45),
        		 axis.text.y = element_text( 
            					size=10, angle=45)) 	+
     geom_text(size=3, angle = 315, hjust = 0,vjust = -.5, check_overlap = TRUE) 

p + xlim(3e10, 1e12) + ylim(3e10, 1e12)           #zooming, set (co)domain
p + scale_x_continuous(limits = c(3e10, 1e12)) +  #and limits
scale_y_continuous(limits = c(3e10, 1e12))

    
```

#Conclusion

Because we suspect an identity relationship, it is not certain what the independent variable is, i.e. whether consumption drives production or availability leads to increased usage. A closer analysis in addition to longitudinal data would contribute to the usage-production dynamic. 
