#https://aschinchon.wordpress.com/2014/08/04/butterfly/

library(ggplot2)

plot_butterfly <- function() {
  npoints=500
  npointsb=1200
  opt <- theme(legend.position="none",
               panel.background = element_blank(),
               panel.grid = element_blank(),
               axis.ticks=element_blank(),
               axis.title=element_blank(),
               axis.text =element_blank())
  t <- seq(0, 10*pi, length = npointsb)
  butterfly <-data.frame(x = sin(t)*(exp(1)^cos(t)-2*cos(4*t)-(sin(t/12))^5), 
                         y = cos(t)*(exp(1)^cos(t)-2*cos(4*t)-(sin(t/12))^5), 
                         s = runif(npointsb, min = 0.1, max = 10), 
                         f = factor(sample(1L:10, npointsb, TRUE)), 
                         a = runif(npointsb, min = 0.2, max = 0.5))
  points <- data.frame(x = runif(npoints, -4, 4), 
                       y = runif(npoints, -3, 5), 
                       s = runif(npoints, min = 30, max =50), 
                       f = factor(sample(1L:10, npoints, TRUE)), 
                       a = runif(npoints, min= 0.05, max = 0.08))
  data=rbind(butterfly, points)
  ggplot(data, aes(x, y, colour = f)) +
    geom_point(alpha = data[["a"]],size=data[["s"]]) + 
    opt
}