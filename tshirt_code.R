library(pixmap)
R <- read.pnm(system.file('pictures/logo.ppm', package = 'pixmap')[1])
R <- addChannels(R)@grey
T <- matrix(strsplit('useR!2014', '')[[1]], nrow = 77, ncol = 101, byrow = TRUE)
T[which(R < 0.75)] <- ' '
write.table(T, 'tshirtImage.txt', row.names = FALSE,
            sep = '', col.names = FALSE, quote = FALSE)
