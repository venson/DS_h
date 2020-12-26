rankhospital <- function(state, outcome, num = "best") {
   # Read outcome-of-care-measures.csv file
  outcome_data <- read.csv("outcome-of-care-measures.csv")
  # check that state and outcome are valid
  oc_range <- c("heart attack", "heart failure", "pneumonia")
  state_range <- unique(outcome_data$State)
  if (sum(state == state_range) == 0) stop("invalid state")
  if (sum(outcome == oc_range) == 0) stop("invalid outcome")
  # subset the data for futher operation
  outcome_state <- outcome_data[outcome_data$State == state, ]
  # Remove the row which on the coln row is NA, and convert into numerij
  cleandata  <- function(data, coln) {
    data_new <- data[!is.na(data[, coln]), ]
    data_new[, coln]  <- as.numeric(data_new[, coln], na.rm = TRUE)
    data_new
  }
  rankh <- function(data, coln, num = "best") {
    if (num == "best") {
      i <- order(data[, coln], data[2])
      data[i[1], 2]
    } else if (num == "worst") {
      data[order(-data[, coln], data[2])[1], 2]
    } else {
      x <- order(data[, coln], data[2])
      data[x[num], 2]
    }
  }
  if (outcome == "heart attack") {
    outcome_state_clean <- cleandata(outcome_state, 11)
    answer <- rankh(outcome_state_clean, 11, num)
  }else if  (outcome == "heart failure") {
    outcome_state_clean <- cleandata(outcome_state, 17)
    answer <- rankh(outcome_state_clean, 17, num)
  }else if (outcome == "pneumonia") {
    outcome_state_clean <- cleandata(outcome_state, 23)
    answer <- rankh(outcome_state_clean, 23, num)
  }
    answer
  }
