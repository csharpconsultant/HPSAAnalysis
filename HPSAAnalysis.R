setwd("D:/data")
getwd()

install.packages("xlsx")

library(xlsx)
hpsa_frame <- read.xlsx("HPSA.xlsx",sheetName="HPSA")
print(hpsa_frame)

print(head(hpsa_frame, n=3))

print(str(hpsa_frame))

print(summary(hpsa_frame))

subset <- hpsa_frame[grep("Designated", hpsa_frame$HPSA.Status),]

print(summary(subset))

library(ggplot2)
qplot(hpsa_frame$HPSA.Discipline,  hpsa_frame$HPSA.Score, data=hpsa_frame, geom="violin",trim=FALSE, fill=hpsa_frame$HPSA.Discipline, main="HPSA Scores By Discipline")

p <- qplot(hpsa_frame$Designation.Type,  hpsa_frame$HPSA.Score, data=hpsa_frame, geom="violin",trim=FALSE, fill=hpsa_frame$Designation.Type, main="HPSA Scores By Designation Type")
p + scale_x_discrete(labels = abbreviate)

qplot(subset$HPSA.Score, data=subset, geom=c("histogram"), main="HPSA Scores", binwidth=2, bins=30)








