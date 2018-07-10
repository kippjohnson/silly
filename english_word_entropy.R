
library(acss) # entropy calculation function
library(data.table)

## English word dictionary
raw <- fread("https://raw.githubusercontent.com/dwyl/english-words/master/words_alpha.txt", header=F)

colnames(raw) <- c('word')
raw[, nc:=nchar(word)]
dict <- raw[nc>1]

dict[, en:=acss::entropy(word)] # calculate entropy

pi <- 3.1415926535
dict[, diff:=abs(en-pi)]
setkey(dict, diff)

dict[diff<=1.465823e-04]

# Plot is slow b/c of 400k points
plot(dict$nc, dict$en, xlab="Number of Characters", ylab="Entropy")
