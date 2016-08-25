url <- "http://emidius.mi.ingv.it/CPTI15-DBMI15/data/CPTI15_v1.5.xls"
local_file <- 'CPTI15_v1.5.xls'

if(!file.exists(local_file)){
  download.file(url,local_file)
}

# http://stackoverflow.com/a/29108475/15485
library(readxl)
df <- read_excel(local_file, sheet = "catalogue")

df$date_time <- as.POSIXct(paste(df$Year,df$Mo,df$Da,df$Ho,df$Mi,df$Se), format="%Y %m %d %H %M %S")
df$time <- as.POSIXct(paste(df$Ho,df$Mi,df$Se), format="%H %M %S")

head(df)

subset <- data.frame(date_time=df$date_time,time=df$time,epicentral_area=df$EpicentralArea,MwDef=df$MwDef)
subset <- na.omit(subset)
nrow(subset)

# http://emidius.mi.ingv.it/CPTI15-DBMI15/description_CPTI15.htm
# http://emidius.mi.ingv.it/CPTI15-DBMI15/images/docs/CPTI15_IT_fig01.png
png(filename="MwDef_vs_time-of-day.png",width=800,height = 600)
plot(subset$time,subset$MwDef)
dev.off()

head(subset[with(subset, order(-MwDef)), ]$epicentral_area)
head(subset[with(subset, order(-MwDef)), ]$date_time)
head(subset[with(subset, order(-MwDef)), ]$MwDef)

s2 <- subset[with(subset, order(-MwDef)), ]