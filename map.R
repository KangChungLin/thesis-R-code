library(ggmap)
library(mapproj)

register_google(key = '')
map <- get_map(location = c(lon = 121, lat = 24), zoom = 7,language = "zh-TW")
ggmap(map)+ geom_point(aes(x = 121.4, y = 24.55, size = 1))


map <- get_map(location = c(lon = 121.378, lat = 24.54), zoom = 11,maptype = 'hybrid'
                 ,language = "zh-TW")
ggmap(map,darken = c(0.2,'white'))+ geom_point(aes(x = 121.378, y = 24.54, size = 1))
