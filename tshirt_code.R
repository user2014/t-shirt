# jo f. with thanks to:
# http://is-r.tumblr.com/post/46821313005/to-plot-them-is-my-real-test
# http://stackoverflow.com/questions/12918367/in-r-how-to-plot-with-a-png-as-background
# http://students.washington.edu/mclarkso/documents/figure%20layout%20Ver1.R
# http://georeferenced.wordpress.com/2013/01/15/rwordcloud/

rm(list=ls())
sapply(c("stringr", "jpeg", "RCurl", "EBImage", "wordcloud", "tm"),library, character.only=TRUE)
allImageURLs <- c("http://upload.wikimedia.org/wikipedia/commons/c/c1/Rlogo.png",
				  "http://www.memes.at/faces/cereal_guy_squint.jpg",
				  "http://img2.wikia.nocookie.net/__cb20120912234733/ragecomic/images/9/91/Cereal_Guy_Spitting.jpeg")
imageList <- list()
for(imageURL in allImageURLs) {
	print(imageURL)
   tempName <- str_extract(imageURL,"([[:alnum:]_-]+)([[:punct:]])([[:alnum:]]+)$")
   print(tempName)
   tempImage <- readImage(imageURL) 
   imageList[[tempName]] <- tempImage 
}
par(mfrow=c(2,2))	
plot(0:10, 0:10, type="n", axes=F, ann=FALSE)
rasterImage(imageList[[1]],1,1,10,10)
box("figure", col="black", lwd=2)
plot(0:10, 0:10, type="n", axes=F, ann=FALSE)
rasterImage(imageList[[2]],1,1,10,10)
box("figure", col="black", lwd=2)
useR <- Corpus (DirSource("./useRdir"))
useR <- tm_map(useR, stripWhitespace)
useR <- tm_map(useR, tolower)
useR <- tm_map(useR, removeWords, stopwords('english'))
wordcloud(useR, scale=c(4,1.25), max.words=100, random.order=FALSE, rot.per=0.35, use.r.layout=FALSE, colors=brewer.pal(8,'Dark2'))
box("figure", col="black", lwd=2)
plot(0:10, 0:10, type="n", axes=F, ann=FALSE)
rasterImage(imageList[[3]],1,1,10,10)
box("figure", col="black", lwd=2)
