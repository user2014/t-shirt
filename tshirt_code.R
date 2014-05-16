library(pixmap)
R <- read.pnm(system.file('pictures/logo.ppm', package = 'pixmap')[1])
R <- addChannels(R)@grey
R <- substr(as.character(R < 0.75), 1, 1)
R <- matrix(R, nrow = 77)
R[which(R == 'F')] <- ' '
R[which(R == 'T', arr.ind = TRUE)] <- strsplit('useR!2014', '')[[1]]
write.table(R, 'tshirtImage.txt', row.names = FALSE,
            sep = '', col.names = FALSE, quote = FALSE)
