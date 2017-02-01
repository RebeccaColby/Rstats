install.packages("dplyr")
library(dplyr)

HWAdata <- read.csv("02 - Data Storage in R/HWA_Data.csv")
head(HWAdata)

HWAdata <- select(HWAdata, Time, DensClass, Height..m., BirdID, Ovisacs, CrawlerCount)
head(HWAdata)

birds <- c("CAWA", "COYE", "NAWA", "OVEN")
HighDens <- filter(HWAdata, DensClass=="High")
HighDens

m2f <- function(m) {m*3.28084}

HighDens <- mutate(HighDens, ht.ft = (m2f(Height..m.)))
head(HighDens)

HighDens <- select(HighDens, DensClass, BirdID, Ovisacs, CrawlerCount, ht.ft)
head(HighDens)

crawlbyspec <- summarize(group_by(HighDens, BirdID), mean(CrawlerCount))
crawlbyspec

countbirds <- count(group_by(HighDens, CrawlerCount), BirdID)
countbirds

YWEA.NAWA.CAWA <- HWAdata %>%
  select(DensClass, BirdID, Ovisacs, CrawlerCount) %>%
  filter(BirdID== c("YEWA", "NAWA", "CAWA")) %>%
  group_by(BirdID) %>%
  summarize(mean(CrawlerCount)) %>%
  print(YEWA.NAWA.CAWA)
# ^ didn't work...

## tidyr assumes wide data (classic excel setup)

## gather turns wide into tall data
