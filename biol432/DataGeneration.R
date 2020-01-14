#Part I 
#Step 4
Species <- c("Felis catus", "Mus musculus", "Ateles fusciceps", 
             "Bradypus tridactylus", "Pterois volitans", "Camelus dromedarius",
             "Ornithorhynchus anatinus", "Canis lupus", "Pongo abelii",
             "Panthera tigris")

#Step 5
Limb.Width <- c(rnorm(10, mean = 10, sd = 10))

#Step 6
Limb.Width <- abs(Limb.Width)

#Step 7
#Randomly selected 0 and 1 from binomial distribution then coverted 0 to mm and 1 to cm. 
unitsW <- c(rbinom(10, size = 1, prob = 0.5))
for(i in 1:length(unitsW)) {
  if(unitsW[i] == "0") {
    unitsW[i] <- "mm"
    } else {
      unitsW[i] <- "cm"
      }
}

#Step 8
Limb.Length <- c(rnorm(10, mean = 100, sd = 100))
Limb.Length <- abs(Limb.Length)

#Step 9
#Randomly selected 0 and 1 from binomial distribution then coverted 0 to mm and 1 to cm.
unitsL <- c(rbinom(10, size = 1, prob = 0.5))
for(i in 1:length(unitsL)) {
  if(unitsL[i] == "0") {
    unitsL[i] <- "mm"
  } else {
    unitsL[i] <- "cm"
  }
}

#Step 10
MyData <- data.frame("Organism" = Species, "Limb.Width" = Limb.Width,
                     "unitsW" = unitsW, "Limb.Length" = Limb.Length,
                     "unitsL" = unitsL)

#Step 11
write.csv(MyData, "measurements.csv")
  
  
  
  
  
  
  
  
  
  
  








