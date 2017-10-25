pollutantmean <- function(directory, pollutant, id = 1:332) 
{
  # Get a list of filenames
  files <- list.files(directory)
  # initialize vector to hold values
  readings <- vector()
  for(i in seq_along(id)) 
  {
    # loops through the files, rbinding them together  
    readings <- rbind(readings, read.csv(files[id[i]]))
  }
  # finding the mean upto 3 decimal places
  round(mean(readings[[pollutant]], na.rm = TRUE), 3)
}

pollutantmean("specdata", "sulfate", 1:10) == 4.064
pollutantmean("specdata", "nitrate", 70:72) == 1.706
pollutantmean("specdata", "sulfate", 34) == 1.477
pollutantmean("specdata", "nitrate") == 1.703
