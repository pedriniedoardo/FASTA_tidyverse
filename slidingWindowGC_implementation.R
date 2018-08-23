# load required libraries
library(tidyverse)
# implementation of the function slidingWindowGC
# define a paremeter w (window width) and an input file.
slidingWindowGC <- function(w = NULL,input = NULL){
  # create a data frame with the index of the window based on w parameter
  data.frame(index = rep(seq(1, length(input)-w, by = w),each = w))%>%
    # add the sequence of the FASTA file to the data frame (remove the value of teh sequence that are not filling a whole bin the the window)
    mutate(seq = input[1:length(index)])%>%
    # split the sequence in a list of windows elements
    split(f = .$index)%>%
    # apply the GC function to all the chunks
    lapply(function(x){
      GC(input = x$seq)
    })%>%
    bind_rows(.id = "start_pos")
}
# the functino returns a dataframe with position (by chunk) and CG proportion in the chunk.
# this is handy to make plots in ggplot
