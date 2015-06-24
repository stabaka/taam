# Name: create_dendrogram
# Description: Create a dendrogram for viewing in Spotfire Analyst.
# Keywords: dendrogram;graphics;jminardi
# Allow caching: TRUE

# Inputs----
# rpath | value | path to R.exe | path to R.exe | FALSE | "String"
# m | value | response levels | number of response levels | FALSE | "Integer"
# n | value | rows | number of rows | FALSE | "Integer"

# Outputs----
# img | value | output image | output image
# msg | value | message | message


# ################################
# Start interactive configuration.

rpath <- "D:/Program Files/R/R-3.1.2/bin/R"
m <- 3
n <- 40

# End interactive configuration.
# ##############################

msg <- "dendrogram"
library(RinR)
options(RinR_R_FULL_PATH=rpath)
library(arbor)

df <- data.frame(y=sample(letters[sample(1:length(letters), m)], n, replace=TRUE), 
  x1=rnorm(n), x2=runif(n), x3=sample(LETTERS, n, replace=TRUE))
fit <- arbor(y ~ x1 + x2 + x3, method="class", data=df)

y <- try(img <- RGraph({
  library("rpart");
  class(fit) <- "rpart";
  assign("formatg", function(x, digits = options()$digits, format = paste("%.",digits, "g", sep = "")) 
   {if(!is.numeric(x)) {stop("'x' must be a numeric vector")}; 
    temp <- sprintf(format, x); if(is.matrix(x)) {matrix(temp, nrow = nrow(x))} else temp}, envir=.GlobalEnv);
  par(mfrow = c(1,2), xpd = NA); 
  plot(fit, uniform=TRUE, main="Random Classification Tree"); 
  text(fit, use.n=TRUE, all=TRUE, cex=.8)}, 
  width=500, height=500, display=FALSE))

# Run this to show a graphic in the RStudio Viewer pane.
# RGraph({
# library("rpart");
# class(fit) <- "rpart";
# assign("formatg", function(x, digits = options()$digits, format = paste("%.",digits, "g", sep = "")) 
# {if(!is.numeric(x)) {stop("'x' must be a numeric vector")}; 
#   temp <- sprintf(format, x); if(is.matrix(x)) {matrix(temp, nrow = nrow(x))} else temp}, envir=.GlobalEnv);
# par(mfrow = c(1,2), xpd = NA); 
# plot(fit, uniform=TRUE, main="Random Classification Tree"); 
# text(fit, use.n=TRUE, all=TRUE, cex=.8)}, width=500, height=500, display=TRUE)

if (is(y, "try-error")) {
  img <- raw(1)
  msg <- paste(as.character(attr(y, "condition")), collapse="\n")
}

