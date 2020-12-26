complete  <- function(directory, id = 1:332) {
  dirpath  <- paste(getwd(), directory, sep = "/")
  filename <- list.files(dirpath)
  fullpath <- paste(dirpath, filename, sep = "/")
  cases_data <- data.frame(id = integer(0), nobs = integer(0),
                           stringsAsFactors = FALSE)
  for (i in id) {
    tmp_data  <- read.csv(fullpath[i])
    complete_count  <- sum(complete.cases(tmp_data$Date,
                                          tmp_data$sulfate,
                                          tmp_data$nitrate,
                                          tmp_data$ID
                                          ))
    new_line <- c(i, complete_count)
    cases_data <- rbind(cases_data, new_line)

    # cases_data
  }
    names(cases_data) <- c("id", "nobs")
    cases_data
}
