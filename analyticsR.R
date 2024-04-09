library(tidyverse)
library(readxl)
library(ggplot2)
install.packages("ggplot2")
salmo <- read_excel("salmo.xlsx")

#horizontal  boxplot of coverage
boxplot(salmo$Coverage,horizontal=T,
        col = c("lightgreen"),
        xlab = "Percent Coverage",
        main = "Horizontal Boxplot of Coverage")


-------------
#bar chart which shows the proportion of peptides whose
#coverage was greater than the mean and less than the mean

#Calculate mean coverage
mean_coverage <- mean(salmo$Coverage)

#Proportion of peptides above and below the mean coverage
above_mean_prop <- mean(salmo$Coverage > mean_coverage)
below_mean_prop <- mean(salmo$Coverage <= mean_coverage)

coverage_data <- data.frame(
  category = c("Above Mean", "Below or Equal to Mean"),
  proportion = c(above_mean_prop, below_mean_prop)
)

#ggplot
ggplot(coverage_data, aes(x = category, y = proportion)) +
  geom_bar(stat = "identity", fill = c("lightgreen", "green3")) +
  labs(x = "Coverage", y = "Proportion of Peptides", 
       title = "Proportion of Peptides Above and Below Mean Coverage") + theme_classic()

