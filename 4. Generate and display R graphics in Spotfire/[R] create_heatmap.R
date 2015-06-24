# Name: create_heatmap
# Description: Create a heatmap for viewing in Spotfire Analyst.
# Keywords: heatmap;graphics;jminardi
# Allow caching: TRUE

# Inputs----
# rpath | value | path to R.exe | path to R.exe | FALSE | "String"
# n | value | dims | number of dims | FALSE | "Integer"

# Outputs----
# img | value | output image | output image
# msg | value | message | message


# ################################
# Start interactive configuration.

rpath <- "D:/Program Files/R/R-3.1.2/bin/R"
n <- 40

# End interactive configuration.
# ##############################

msg <- "heatmap"
library(RinR)
options(RinR_R_FULL_PATH=rpath)
z <- matrix(rnorm(n^2), n, n)
y <- try(img <- RGraph(image(list(x=1:n, y=1:n, z=z * row(z) * col(z))), 
  width=500, height=500, display=FALSE))

# Run this to show a graphic in the RStudio Viewer pane.
# RGraph(image(list(x=1:n, y=1:n, z=z * row(z) * col(z))), width=500, height=500, display=TRUE)

if (is(y, "try-error")) {
  img <- raw(1)
  msg <- paste(as.character(attr(y, "condition")), collapse="\n")
}

