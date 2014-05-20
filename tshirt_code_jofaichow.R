## Load libraries
library(RShapeTarget) # available on https://github.com/pierrejacob/RShapeTarget/
library(rPlotter)     # availalbe on https://github.com/woobe/rPlotter
library(wesanderson)  # available on CRAN

## Set seed for reproducibility
set.seed(1234)

## Define word and colours for logo
txt_logo <- "R"
col_logo <- c("white", "steelblue")  ## Also try wes.palette(4, "GrandBudapest")

## Create a shape from the letter R
path_word <- extract_paths_from_word(txt_logo)

## Create a target with some smoothness parameter lambda
target_word <- create_target_from_word(txt_logo, lambda = 1)

## Generate in a square surrounding the shape
rinit <- function(size)  csr(target_word$bounding_box, size)
x <- rinit(200000)

## Evaluate the log densities associated to these points
logdensities <- target_word$logd(x, target_word$algo_parameters)

## Create a ggplot2 object
g <- plot_paths(path_word) + geom_point(aes(x = x[,1], y = x[,2], alpha = 0.01,
                                            colour = exp(logdensities))) +
  scale_colour_gradientn(colours = col_logo) +
  create_ggtheme("blank") +  # function from rPlotter
  theme(legend.position = "none") # remove legend

## Save as PNG
png(filename = "output_logo.png", width = 2000, height = 2000, res = 300)
print(g)
dev.off()