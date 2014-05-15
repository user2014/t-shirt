R<-c(rep(1,19),rep(0,5), rep(1,20),rep(0,4),
     rep(1,22),rep(0,2),rep(1,6),rep(0,10),rep(1,7),0,
     rep(1,6),rep(0,11),rep(1,7),rep(1,6),rep(0,12),
     rep(1,6),rep(1,6),rep(0,12),rep(1,6), rep(1,6),
     rep(0,12),rep(1,6),rep(1,6),rep(0,12),rep(1,6),
     rep(1,6),rep(0,10),rep(1,7),0,rep(1,23),0,
     rep(1,22),rep(0,2),rep(1,21),rep(0,3),rep(1,19),
     rep(0,5),rep(1,6),rep(0,7),rep(1,5),rep(0,6),
     rep(1,6),rep(0,8),rep(1,4),rep(0,6),rep(1,6),
     rep(0,8),rep(1,5),rep(0,5),rep(1,6),rep(0,9),
     rep(1,4),rep(0,5),rep(1,6),rep(0,9),rep(1,5),
     rep(0,4),rep(1,6),rep(0,10),rep(1,4),rep(0,4),
     rep(1,6),rep(0,10),rep(1,5),rep(0,3),rep(1,6),
     rep(0,11),rep(1,5),rep(0,2),rep(1,6),rep(0,11),
     rep(1,6),rep(0,1),rep(1,6),rep(0,12),rep(1,6))
R2<-rep(c('u','s','e','R','!','2','0','1','4'),64)
R <- ifelse(as.logical(R), R2, "")

R[265:288]<-c('u','s','e','R','!','2','0','1','4','-','-',
              'L','o','s',' ','A','n','g','e','l','e','s','','')
R<-as.data.frame(t(matrix(R,ncol=24)))
names(R)<-rep('.',24)
R
# write.table(R, file="tshirtImage.txt", quote=FALSE)