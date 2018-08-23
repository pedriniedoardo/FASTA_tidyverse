# calculate the proportion of GC is a sequencce
# load the required libraryes
library(tidyverse)
GC <- function(input = NULL){
  s <- factor(str_to_lower(input),levels = c("a","t","c","g"))
  t <- table(s)
  r <- unname((t[names(t)=="g"]+t[names(t)=="c"])/sum(t))
  data.frame(GC=r)
}

