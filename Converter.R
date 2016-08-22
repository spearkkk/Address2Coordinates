# Convert from address to coordinates
# Input is address field
# Output is coordinates(longitude & latitude)
# I use Google Map API.
# If you want to use this code, you get google api key.

# install 'jsonlite' package for parsing the Google APU result
#install.packages("jsonlite")

# load package
library(jsonlite)

# read address data for converting
# I use simple datas. ex) 경기 고양시 일산서구 대화동 1446-2
addressDatas <- read.csv("C:/ExmapleDatas/address_datas.csv", header = FALSE, stringsAsFactors = FALSE)

# replace blank to +, 공백을 +를 바꾼다.
addressDatas <- as.data.frame(apply(addressDatas, 2, function(x){as.data.frame(gsub("\\s", "+", x))}))

# api key & url for query
urlPre = "https://maps.googleapis.com/maps/api/geocode/json?address="
urlPost = "&key="
apiKey = "Your API key"

# initialize longitude and latitude
long <- numeric()
lat <- numeric()

# request coordinates
for(i in 1:nrow(addressDatas)) {
  # generate url for query
  url <- paste0(urlPre, addressDatas[i, 1])
  url <- paste0(url, urlPost)
  url <- paste0(url, apiKey)
  
  print(url)
  doc <- fromJSON(txt = url)
  
  # if length of doc's results is not zero, 
  # I can find longitude & latitude in doc's results
  if(length(doc$results) != 0) {
    long[i] = doc$results$geometry$location$lng
    lat[i] = doc$results$geometry$location$lat
  }
}

# cbind 
addressDatas <- cbind(addressDatas, long)
addressDatas <- cbind(addressDatas, lat)

colnames(addressDatas) <- c("address", "longitude", "latitude")

# write converted datas.
write.csv(addressDatas, "C:/ExmapleDatas/converted_address_datas.csv", row.names = FALSE)
