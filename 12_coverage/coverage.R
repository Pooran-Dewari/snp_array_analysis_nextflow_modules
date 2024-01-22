library(tidyverse)

df <- read_tsv("coverage/hamour.nomissingdata.ldepth.mean.ldepth.mean")

# load the file and play around with MEAN_DEPTH
# can see mostly scaffolds for >100x coverage, which is fine as we targetted 100x coverage anyway

df %>% 
  filter(MEAN_DEPTH > 100) %>% 
  filter(str_detect(CHROM, "SUPER"))


hist(df$MEAN_DEPTH)

hist(df$MEAN_DEPTH,
     ylim=c(0,1000),col="black")


#check mean and median

mean <- mean(df$MEAN_DEPTH)
mean
#72.60278
mean3 = mean*3
mean3
#217.8083

sum(df$MEAN_DEPTH > mean3)
#1119

sum(df$MEAN_DEPTH > mean3)/nrow(df)
#0.0001047254
