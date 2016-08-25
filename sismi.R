url <- "http://emidius.mi.ingv.it/CPTI15-DBMI15/data/CPTI15_v1.5.xls"
local_file <- 'CPTI15_v1.5.xls'

if(!file.exists(local_file)){
  download.file(url,local_file)
}

# http://stackoverflow.com/a/29108475/15485
library(readxl)
df <- read_excel(local_file, sheet = "catalogue")

df$date_time <- as.POSIXct(paste(df$Year,df$Mo,df$Da,df$Ho,df$Mi), format="%Y %m %d %H %M")
df$time <- as.POSIXct(paste(df$Ho,df$Mi), format="%H %M")
df$MwIns

subset <- data.frame(date_time=df$date_time,magnitudo=df$MwIns,time=df$time)
subset <- na.omit(subset)

plot(subset$time,subset$magnitudo)


