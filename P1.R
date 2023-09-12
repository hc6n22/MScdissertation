setwd("C:/Users/Victor/Desktop/Fairness machinelearning/Crime/")

library(readxl)
library(ggplot2)
library(gridExtra)
library(RColorBrewer)
dataP <- read_excel("P.xlsx")
attach(dataP)
mean_err_c0P <- mean(err_c0P)
var_err_c0P <- var(err_c0P)
sqrt(var_err_c0P)
mean_fai_c0P <- mean(fai_c0P)
var_fai_c0P <- var(fai_c0P)
sqrt(var_fai_c0P)
mean_err_c1P <- mean(err_c1P)
var_err_c1P <- var(err_c1P)
sqrt(var_err_c1P)
mean_fai_c1P <- mean(fai_c1P)
var_fai_c1P <- var(fai_c1P)
sqrt(var_fai_c1P)
color_scheme <- brewer.pal(4, "Set1")

plot1 <- ggplot(dataP, aes(x = 1:nrow(dataP), y = err_c0P)) +
  geom_point(aes(color = "Error C=0"), size = 1) +
  geom_hline(yintercept = mean_err_c0P, color = color_scheme[1], linetype = "solid", size = 1) +
  labs(x = "Times", y = 'E') +
  scale_color_manual(values = color_scheme[1]) +
  theme_minimal()

plot2 <- ggplot(dataP, aes(x = 1:nrow(dataP), y = fai_c0P)) +
  geom_point(aes(color = "Fairness C=1"), size = 1) +
  geom_hline(yintercept = mean_fai_c0P, color = color_scheme[2], linetype = "solid", size = 1) +
  labs(x = "Times", y = 'F') +
  scale_color_manual(values = color_scheme[2]) +
  theme_minimal()

plot3 <- ggplot(dataP, aes(x = 1:nrow(dataP), y = err_c1P)) +
  geom_point(aes(color = "Error C=1"), size = 1) +
  geom_hline(yintercept = mean_err_c1P, color = color_scheme[3], linetype = "solid", size = 1) +
  labs(x = "Times", y = 'E') +
  scale_color_manual(values = color_scheme[3]) +
  theme_minimal()

plot4 <- ggplot(dataP, aes(x = 1:nrow(dataP), y = fai_c1P)) +
  geom_point(aes(color = "Fairness C=1"), size = 1) +
  geom_hline(yintercept = mean_fai_c1P, color = color_scheme[4], linetype = "solid", size = 1) +
  labs(x = "Times", y = 'F') +
  scale_color_manual(values = color_scheme[4]) +
  theme_minimal()

grid.arrange(plot1, plot2, plot3, plot4, ncol = 2)