# Name: correlation by rows (stacked)
# Description: return a stacked version of a correlation matrix
# Keywords: correlation;jminardi
# Allow caching: TRUE

# Inputs----
# x | table | x | input table | FALSE | character(0)

# Outputs----
# z | table | z | output table of correlations


# ################################
# Start interactive configuration.

x <- data.frame(a=letters[1:10], b=runif(10), c=runif(10), d=runif(10))

# End interactive configuration.
# ##############################


# Create placeholder when no rows are passed.
if (nrow(x) == 0) {
  x <- data.frame(a="select companies above", b=1)
}

nms <- x[, 1]
# If nms has duplicate values, fix.
if (any(duplicated(nms))) {
  nms <- as.character(nms)
  ord <- order(nms)
  
  osuff <- as.character(unlist(lapply(rle(sort(nms))[["lengths"]], seq)))
  suff <- ifelse(osuff == "1", "", osuff)[order(ord)]
  nms <- paste(nms, suff, sep="")
}

x <- x[, -1]
y <- cor(t(as.matrix(x)), use="na.or.complete")
z <- expand.grid(var1=nms, var2=nms)
z[, "correlation"] <- as.vector(y)

