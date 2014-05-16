library(pixmap)
R <- read.pnm(system.file('pictures/logo.ppm', package = 'pixmap')[1])
R <- addChannels(R)@grey
R <- matrix(
    as.character(
        cut(
            x      = R,
            breaks = c(-Inf, 0.25, 0.5, 0.75, 0.9, Inf),
            labels = c('#', 'x', 'o', '.', ' '),
            include.lowest = TRUE)),
    nrow = 77)
write.table(R, 'tshirtImage.txt', row.names = FALSE,
            sep = '', col.names = FALSE, quote = FALSE)
