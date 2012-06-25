HIPC Lyoplate geo data
-----------------------



```r
library(ggplot2)
library(ggmap)
library(mapdata)
```



```
## Loading required package: maps
```



```r
library(mapproj)
library(RgoogleMaps)
```



```
## Loading required package: png
```



```r
# Set some knitr options
opts_knit$set(progress = TRUE, verbose = TRUE)
opts_chunk$set(cache = FALSE, fig.width = 12, echo = TRUE, eval = TRUE, 
    message = TRUE, warning = TRUE)
```






```r
centers <- read.csv("centers.csv")
```








