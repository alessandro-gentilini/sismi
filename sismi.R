library(LakeMetabolizer) # to get is.nigth

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

subset <- data.frame(date_time=df$date_time,time=df$time,epicentral_area=df$EpicentralArea,MwDef=df$MwDef,LatDef=df$LatDef)
subset <- na.omit(subset)
subset$is_night <- is.night(subset$date_time,subset$LatDef)
subset <- subset[with(subset, order(-MwDef)), ]
subset$count <- 1
subset$total <- cumsum(subset$count)
subset$total_night <- cumsum(subset$is_night)
subset$night_percentage <- subset$total_night/subset$total

head(subset)
to_sec <- subset
write.table(to_sec,"to_sec.csv",sep=",",row.names = FALSE)

subset <- subset[with(subset, order(MwDef)), ]
subset$count <- 1
subset$total <- cumsum(subset$count)
subset$total_night_2 <- cumsum(subset$is_night)
subset$night_percentage_2 <- subset$total_night_2/subset$total


# http://emidius.mi.ingv.it/CPTI15-DBMI15/description_CPTI15.htm
# http://emidius.mi.ingv.it/CPTI15-DBMI15/images/docs/CPTI15_IT_fig01.png
png(filename="MwDef_vs_time-of-day.png",width=800,height = 600)
title = sprintf("Number of events: %d, from %s to %s",nrow(subset),min(subset$date_time),max(subset$date_time))
plot(subset$time,subset$MwDef,xlab="Time of day (to seconds)",ylab="Default moment magnitude (MwDef)",main=title)
dev.off()

png(filename="night_percentage_vs_time-of-day.png",width=800,height = 600)
title = sprintf("Number of events: %d, from %s to %s",nrow(subset),min(subset$date_time),max(subset$date_time))
plot(subset$MwDef,subset$night_percentage,xlab="Default moment magnitude (MwDef)",ylab="Night percentage",main=title)
dev.off()

png(filename="night_percentage_2_vs_time-of-day.png",width=800,height = 600)
title = sprintf("Number of events: %d, from %s to %s",nrow(subset),min(subset$date_time),max(subset$date_time))
plot(subset$MwDef,subset$night_percentage_2,xlab="Default moment magnitude (MwDef)",ylab="Night percentage",main=title)
dev.off()





df$date_time <- as.POSIXct(paste(df$Year,df$Mo,df$Da,df$Ho), format="%Y %m %d %H")
df$time <- as.POSIXct(paste(df$Ho), format="%H")

subset <- data.frame(date_time=df$date_time,time=df$time,epicentral_area=df$EpicentralArea,MwDef=df$MwDef,LatDef=df$LatDef)
subset <- na.omit(subset)
subset$is_night <- is.night(subset$date_time,subset$LatDef)
subset <- subset[with(subset, order(-MwDef)), ]
subset$count <- 1
subset$total <- cumsum(subset$count)
subset$total_night <- cumsum(subset$is_night)
subset$night_percentage <- subset$total_night/subset$total

head(subset)
just_hour <- subset
write.table(just_hour,"just_hour.csv",sep=",",row.names = FALSE)

subset <- subset[with(subset, order(MwDef)), ]
subset$count <- 1
subset$total <- cumsum(subset$count)
subset$total_night_2 <- cumsum(subset$is_night)
subset$night_percentage_2 <- subset$total_night_2/subset$total


# http://emidius.mi.ingv.it/CPTI15-DBMI15/description_CPTI15.htm
# http://emidius.mi.ingv.it/CPTI15-DBMI15/images/docs/CPTI15_IT_fig01.png
png(filename="MwDef_vs_hour-of-day.png",width=800,height = 600)
title = sprintf("Number of events: %d, from %s to %s",nrow(subset),min(subset$date_time),max(subset$date_time))
plot(subset$time,subset$MwDef,xlab="Hour of day",ylab="Default moment magnitude (MwDef)",main=title)
dev.off()

png(filename="night_percentage_vs_hour-of-day.png",width=800,height = 600)
title = sprintf("Number of events: %d, from %s to %s",nrow(subset),min(subset$date_time),max(subset$date_time))
plot(subset$MwDef,subset$night_percentage,xlab="Default moment magnitude (MwDef)",ylab="Night percentage",main=title)
dev.off()

png(filename="night_percentage_2_vs_hour-of-day.png",width=800,height = 600)
title = sprintf("Number of events: %d, from %s to %s",nrow(subset),min(subset$date_time),max(subset$date_time))
plot(subset$MwDef,subset$night_percentage_2,xlab="Default moment magnitude (MwDef)",ylab="Night percentage",main=title)
dev.off()




