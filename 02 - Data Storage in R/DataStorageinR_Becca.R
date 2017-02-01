getwd()

# Importing Data
data <- read.csv("HWA_Data.csv")
View(data)

# Learning About Vectors
Point <- seq(1,12)
point <- 1:12

## character vectors
site <- c("A","B","C",
          "A","B","C",
          "A","B","C",
          "A","B","C")
Site <- rep(c("A", "B", "C"), 4)
Location <- rep(c("Edge", "Interior"), each = 3, length = 12)
Duration <- as.character(rep(c("5", "10"), each = 6, length= 12))
str(Duration)

## numeric vectors
species_count <- c(12, 10, 13, 11, 13, 12, 19, 10, 12, 11, 21, 12)

## logical vector
logic <- species_count > 20
species_count[which(species_count > 20)]

# Factors
SiteFactor <- factor(Site, levels = c("A", "B", "C"))
LocationFactor <- factor(Location, levels = c("Edge", "Interior"))
DurationFactor <- factor(Duration, levels = c("5", "10"))

# Creating A Table
bird.table2 <- cbind(Point, Site, Location, Duration, species_count)

as.data.frame(bird.table2)
write.csv(bird.table2, "bird.table2.csv")

# Exporting A Data Frame
Birds <- data.frame(Point, Site, Location, Duration, species_count)










