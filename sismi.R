# url <- "http://emidius.mi.ingv.it/CPTI15-DBMI15/data/CPTI15_v1.5.ods"
# 
# 
# library(readODS)
# 
# download.file(url,'CPTI15_v1.5.ods')
# 
# df <- read.ods('CPTI15_v1.5.ods')

url <- "http://emidius.mi.ingv.it/CPTI15-DBMI15/data/CPTI15_v1.5.xls"
local_file <- 'CPTI15_v1.5.xls'
download.file(url,local_file)

library(readxl)
df <- read_excel(local_file, sheet = "catalogue")
