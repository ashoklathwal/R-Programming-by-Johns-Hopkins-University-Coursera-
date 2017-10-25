complete <- function(directory, id = 1:322) 
  {
  files <- list.files(directory, full.names = TRUE)
  n <-  length(id)
  readings = data.frame(id = numeric(n), nobs = numeric(n))
  for(i in seq_along(id)) 
    {
    reading <- read.csv(files[id[i]])
    readings$id[i] <- id[i]
    readings$nobs[i] <- sum(complete.cases(reading$sulfate, reading$nitrate))
    }
  readings
}
cc <- complete("specdata", c(6, 10, 20, 34, 100, 200, 310))
print(cc$nobs)
cc <- complete("specdata", 54)
print(cc$nobs)
set.seed(42)
cc <- complete("specdata", 332:1)
use <- sample(332, 10)
print(cc[use, "nobs"])
