corr  <- function(directory, threshold = 0) {
  dirpath  <- paste(getwd(), directory, sep = "/")
  filename <- list.files(dirpath)
  fullpath <- paste(dirpath, filename, sep = "/")
  corrv <- vector(mode = "numeric")
  com_data <- complete("specdata", seq_along(filename))
  id <- com_data[com_data$nobs > threshold, 1]
  for (i in id) {
    new_data <- read.csv(fullpath[i])
    clean  <- complete.cases(new_data$Date,
                           new_data$sulfate,
                           new_data$nitrate,
                           new_data$ID)
  clean_data <- new_data[clean, ]
  corrv <- c(corrv, cor(clean_data$sulfate, clean_data$nitrate))
  }
  corrv
}
