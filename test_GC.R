# test the GC function
library(seqinr)
fasta <- read.fasta(file = "sequence.fasta")
# the file is a list, in fact it might contain different sequences
# to extract the single sequences use the list notation.
seq <- fasta[[1]]

# test the function
GC(seq)

# test with borderline cases
GC(c("a","a","a"))
GC(c("b","b","b"))
GC(c("c","c","c"))
GC(c("a","c","g","t"))
GC(c("A","c","G","t"))
