pollutantmean <- function(directory, pollutant, id = 1:332) {
  dirpath  <- paste(getwd(), directory, sep = "/")
  filename  <- list.files(dirpath)
  fullname  <- paste(dirpath, filename, sep = "/")
  for (i in id) {
    if (i == id[1]) {
      pull_data  <- read.csv(fullname[i])
    }else{
         new_data <- read.csv(fullname[i])
         pull_data <- rbind(pull_data, new_data)
        }
    }
  if (pollutant == "sulfate") {
    pmean  <- mean(pull_data$sulfate, na.rm = TRUE)
  }else if (pollutant == "nitrate") {
    pmean  <- mean(pull_data$nitrate, na.rm = TRUE)
  }
  pmean
}
