rankall <-  function(outcome, num = "best") {
   # Read outcome-of-care-measures.csv file
  outcome_data <- read.csv("outcome-of-care-measures.csv")
  # check that state and outcome are valid
  oc_range <- c("heart attack", "heart failure", "pneumonia")
  if (sum(outcome == oc_range) == 0) stop("invalid outcome")
  # Remove the row which on the coln row is NA, and convert into numerij
  cleandata  <- function(data, coln) {
    index <- !is.na(data[, coln])
    data_new <- data.frame(hosptial = data[index, 2],
                           state = data[index, 7],
                           rate = as.numeric(data[index, coln]))
    data_new
  }
  # proces the data according to outcome
  if (outcome == "heart attack") {
    outcome_clean <- cleandata(outcome_data, 11)
  }else if  (outcome == "heart failure") {
    outcome_clean <- cleandata(outcome_data, 17)
  }else if (outcome == "pneumonia") {
    outcome_clean <- cleandata(outcome_data, 23)
  }
    outcome_s <- split(outcome_clean, outcome_clean$state)
  # find the hospital to given rank
  if (num == "best") {
    list <- sapply(outcome_s, function(x)  x[order(x[, 3], x[1])[1], 1])
  }else if (num == "worst") {
    list <- sapply(outcome_s, function(x) x[order(-x[, 3], x[1])[1], 1])
  }else {
    list <- sapply(outcome_s, function(x)  x[order(x[, 3], x[1])[num], 1])
  }
    answer <- data.frame(hospital = list, state = names(list))
    answer
  }
