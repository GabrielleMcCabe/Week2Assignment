#Part II
#Step 1
MData <- read.csv("Data/measurements.csv", header = TRUE)

#Step 2
MData$Limb.Width.cm <- MData$Limb.Width
for(i in 1:length(MData$Limb.Width.cm)) {
  if(MData$unitsW[i] == "mm") {
    MData$Limb.Width.cm[i] <- MData$Limb.Width[i] / 10
  } 
}

MData$Limb.Length.cm <- MData$Limb.Length 
for(i in 1:length(MData$Limb.Length.cm)) {
  if(MData$unitsL[i] == "mm") {
    MData$Limb.Length.cm[i] <- MData$Limb.Length[i] / 10
  } 
}

MData$Volume <- MData$Limb.Width.cm * MData$Limb.Length.cm  #Assuming limb volume = length * width 

#Part III
library(ggplot2)
pdf("WidthLengthRelationship.pdf", width = 7.87402, height = 7.87402)  #Calculated 20 cm = 7.87402 inches

#Clean theme for presentations & publications used in the Colautti Lab
theme_pubworthy <- function (base_size = 12, base_family = "") {
  theme_classic(base_size = base_size, base_family = base_family) %+replace% 
    theme(
      axis.text = element_text(colour = "black"),
      axis.title.x = element_text(size=18),
      axis.text.x = element_text(size=12),
      axis.title.y = element_text(size=18,angle=90),
      axis.text.y = element_text(size=12),
      axis.ticks = element_blank(), 
      panel.background = element_rect(fill="white"),
      panel.border = element_blank(),
      plot.title=element_text(face="bold", size=24),
      legend.position="none"
    ) 
}

qplot(x = Limb.Width.cm, y = Limb.Length.cm, data = MData, size = I(5),
      xlab = "Limb Width (cm)", ylab = "Limb Length (cm)") + theme_pubworthy()

dev.off()


