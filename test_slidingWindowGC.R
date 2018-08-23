# test the function slidingWindowGC
library(seqinr)
fasta <- read.fasta(file = "sequence.fasta")
# the file is a list, in fact it might contain different sequences
# to extract the single sequences use the list notation.
seq <- fasta[[1]]

# test the function
# try one window

slidingWindowGC(w = 50,input = seq)

# try more windows

win <- c(10,50,100,200)
lut <- data.frame(window = win,ID = as.character(seq_along(win)),stringsAsFactors = F)

res <- lapply(win,function(x){
  slidingWindowGC(w = x,input = seq)
})%>%
  bind_rows(.id = "ID")%>%
  left_join(lut,by = "ID")

# by facet
res%>%
  ggplot(aes(x = as.numeric(start_pos),y = GC))+geom_line()+geom_point()+facet_wrap(~window)+xlab("position")
# by color
res%>%
  ggplot(aes(x = as.numeric(start_pos),y = GC,col=as.factor(window)))+geom_line(size=2,alpha=0.4)

