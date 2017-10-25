corr <- function(directory, threshold = 0) 
 {
    files <- list.files(directory, full.names = TRUE)
    readings <- vector(mode = "numeric")
    for(i in seq_along(files)) 
      {
         reading <- read.csv(files[i])
         ok <- complete.cases(reading$sulfate, reading$nitrate)
         reading <- reading[ok,]
         if(sum(ok) > threshold) 
           {
              readings <- append(readings, cor(reading$sulfate, reading$nitrate))
           }
      }
  as.vector(readings)
}
cr <- corr("specdata")                
cr <- sort(cr)                
set.seed(868)                
out <- round(cr[sample(length(cr), 5)], 4)
print(out)

cr <- corr("specdata", 129)                
cr <- sort(cr)                
n <- length(cr)                
set.seed(197)                
out <- c(n, round(cr[sample(n, 5)], 4))
print(out)

cr <- corr("specdata", 2000)                
n <- length(cr)                
cr <- corr("specdata", 1000)                
cr <- sort(cr)
print(c(n, round(cr, 4)))

