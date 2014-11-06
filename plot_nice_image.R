library(ggplot2)

#source of the butterfly equation and code
#https://aschinchon.wordpress.com/2014/08/04/butterfly/
butterfly_equation <- function(t)
  data.frame(x = sin(t)*(exp(1)^cos(t)-2*cos(4*t)-(sin(t/12))^5), 
             y = cos(t)*(exp(1)^cos(t)-2*cos(4*t)-(sin(t/12))^5))

#source of the heart equation
#http://stackoverflow.com/questions/8082429/plot-a-heart-in-r
heart_equation <- function(t)
  data.frame(x = 16*sin(t)^3, 
             y = (13*cos(t)-5*cos(2*t)-2*cos(3*t)-cos(4*t))+8)/6

plot_nicely <- function(what) {
  pos_images <- c("heart", "butterfly")
  image_function <- switch(what,
                           butterfly = butterfly_equation,
                           heart = heart_equation)
  
  npoints=500
  npointsb=1200
  opt <- theme(legend.position="none",
               panel.background = element_blank(),
               panel.grid = element_blank(),
               axis.ticks=element_blank(),
               axis.title=element_blank(),
               axis.text =element_blank())
  t <- seq(0, 10*pi, length = npointsb)
  point_image <- cbind(image_function(t),
                     data.frame(s = runif(npointsb, min = 1, max = 15), 
                                f = factor(sample(1L:10, npointsb, TRUE)), 
                                a = runif(npointsb, min = 0.2, max = 0.5)))
  points <- data.frame(x = runif(npoints, -4, 4), 
                       y = runif(npoints, -3, 5), 
                       s = runif(npoints, min = 30, max =50), 
                       f = factor(sample(1L:10, npoints, TRUE)), 
                       a = runif(npoints, min= 0.05, max = 0.08))
  data=rbind(point_image, points)
  ggplot(data, aes(x, y, colour = f)) +
    geom_point(alpha = data[["a"]],size=data[["s"]]) + 
    opt
}

plot_nicely("heart")
