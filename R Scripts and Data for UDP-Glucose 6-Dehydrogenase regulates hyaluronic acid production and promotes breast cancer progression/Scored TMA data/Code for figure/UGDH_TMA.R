# load required packages
library(ggplot2)

# set working dir
setwd("D:/HA Project/TMA Staining")

# read scored data
UGDH.TMA=read.table("UGDH_TMA_2.txt",header=T, row.names=1, sep="\t")

# make boxplots / jitter plots of scores by desired variables

# used in defense / manuscript
brew=c("#FFFFFF","#FF9900","#CC0000") #Set group colors: white, orange, darkred ("#FFCC33"- yellow,"#FF9900"- orange,"#CC3300"-red)
# Colored Jitter dot plot
ggplot(UGDH.TMA, aes(x=Tissue_Labels, y=UGDH_Score))+ #establish data for plot
  geom_jitter(position = position_jitter(height = 0.25, width = 0.25), aes(fill=Tissue_Labels), stroke=2, colour="black",shape=21, size=5)+ #sets jitter dots, color, size, and outline
  scale_fill_manual(values = brew)+ #change color for groups
  theme_classic()+ #cleans up background
  labs(title="UGDH TMA Score  by Tissue Type",x="Tissue Type", y = "TMA Score") #label axes
#save as 11x8 pdf
ggsave("UGDH TMA Score  by Tissue Type - non-malignant vs invasive vs metastatic 2.pdf", width = 8, height = 8)

# used in thesis
boxplot(UGDH_Score~Tissue_Type,data=UGDH.TMA, main="UGDH Intensity by Type", 
        xlab="Tissue Type", ylab="UGDH TMA Score")

# other comparisons
boxplot(UGDH_Score~Pathology.diagnosis...,data=UGDH.TMA, main="UGDH Intensity by Pathology", 
        xlab="Pathology Diagnosis", ylab="UGDH TMA Score")

boxplot(UGDH_Score~Age_group,data=UGDH.TMA, main="UGDH Intensity by Age Group", 
        xlab="Age Group", ylab="UGDH TMA Score")

boxplot(UGDH_Score~Grade...,data=UGDH.TMA, main="UGDH Intensity by Grade", 
        xlab="Grade", ylab="UGDH TMA Score")

boxplot(UGDH_Score~Stage...,data=UGDH.TMA, main="UGDH Intensity by Stage", 
        xlab="Stage", ylab="UGDH TMA Score")

boxplot(UGDH_Score~Type.....,data=UGDH.TMA, main="UGDH Intensity by Type", 
        xlab="Type", ylab="UGDH TMA Score")

boxplot(UGDH_Score~TNM...,data=UGDH.TMA, main="UGDH Intensity by TNM...", 
        xlab="TMN", ylab="UGDH TMA Score")

boxplot(UGDH_Score~ER...,data=UGDH.TMA, main="UGDH Intensity by ER", 
        xlab="ER", ylab="UGDH TMA Score")

boxplot(UGDH_Score~PR...,data=UGDH.TMA, main="UGDH Intensity by PR", 
        xlab="PR", ylab="UGDH TMA Score")

boxplot(UGDH_Score~HER2...,data=UGDH.TMA, main="UGDH Intensity by HER2", 
        xlab="HER2", ylab="UGDH TMA Score")

score=as.matrix(UGDH.TMA$Inverted_Score)
score2=as.matrix(UGDH.TMA$UGDH_Score)

image(score)
score.matrix = cbind(score, score2)

library(gplots)
hmcols<-colorRampPalette(c("white","yellow","orange","red"))(10000)
heatmap.2(score.matrix, col=hmcols, Colv=T, Rowv=T, 
          key=TRUE, symkey=FALSE, density.info="none", trace="none",cexRow=0.5)
