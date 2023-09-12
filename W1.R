setwd("C:/Users/Victor/Desktop/Fairness machinelearning/Crime/")
install.packages("readxl")
install.packages("gridExtra")
install.packages("RColorBrewer")
library(readxl)
library(ggplot2)
library(gridExtra)
library(RColorBrewer)
dataW <- read_excel("W.xlsx")
attach(dataW)
mean_err_c0w <- mean(dataW$errc0w)
var_err_c0w <- var(dataW$errc0w)
sqrt(var_err_c0w)
mean_faic0w <- mean(dataW$faic0w)
var_faic0w <- var(dataW$faic0w)
sqrt(var_faic0w)
mean_err_c1w <- mean(dataW$errc1w)
var_err_c1w <- var(dataW$errc1w)
sqrt(var_err_c1w)
mean_faic1w <- mean(dataW$faic1w)
var_faic1w <- var(dataW$faic1w)
sqrt(var_faic1w)
color_scheme <- brewer.pal(4, "Set1")

plot1 <- ggplot(dataW, aes(x = 1:nrow(dataW), y = errc0w)) +
  geom_point(aes(color = "Error C=0"), size = 1) +
  geom_hline(yintercept = mean(dataW$errc0w), color = color_scheme[1], linetype = "solid", size = 1) +
  labs(x = "Times", y = 'E') +
  scale_color_manual(values = color_scheme[1]) +
  theme_minimal()  

plot2 <- ggplot(dataW, aes(x = 1:nrow(dataW), y = faic0w)) +
  geom_point(aes(color = "Fairness C=1"), size = 1) +
  geom_hline(yintercept = mean(dataW$faic0w), color = color_scheme[2], linetype = "solid", size = 1) +
  labs(x = "Times", y = 'F') +
  scale_color_manual(values = color_scheme[2]) +
  theme_minimal()

plot3 <- ggplot(dataW, aes(x = 1:nrow(dataW), y = errc1w)) +
  geom_point(aes(color = "Error C=1"), size = 1) +
  geom_hline(yintercept = mean(dataW$errc1w), color = color_scheme[3], linetype = "solid", size = 1) +
  labs(x = "Times", y = 'E') +
  scale_color_manual(values = color_scheme[3]) +
  theme_minimal()

plot4 <- ggplot(dataW, aes(x = 1:nrow(dataW), y = faic1w)) +
  geom_point(aes(color = "Fairness C=1"), size = 1) +
  geom_hline(yintercept = mean(dataW$faic1w), color = color_scheme[4], linetype = "solid", size = 1) +
  labs(x = "Times", y = 'F') +
  scale_color_manual(values = color_scheme[4]) +
  theme_minimal()

grid.arrange(plot1, plot2, plot3, plot4, ncol = 2)