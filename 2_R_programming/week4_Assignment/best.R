best <- function(state, outcome) {
  # Read outcome-of-care-measures.csv file
  outcome_data <- read.csv("outcome-of-care-measures.csv")
  # check that state and outcome are valid
  oc_range <- c("heart attack", "heart failure", "pneumonia")
  state_range <- unique(outcome_data$State)
  if (sum(state == state_range) == 0) stop("invalid state")
  if (sum(outcome == oc_range) == 0) stop("invalid outcome")
  # subset the data for futher operation
  outcome_state <- outcome_data[outcome_data$State == state, ]
  # funcion return a hospital vector with the lowest rate
  # The length of the vector is 1 ,if there is no tie
  best_hospitals <- function(data, coln) {
    colmin <- min(data[, coln], na.rm = TRUE)
    data[data[, coln] == colmin, 2]
  }
  # return hospital name with the lowest 30-day death
  if (outcome == "heart attack") {
    outcome_state[, 11] <- as.numeric(outcome_state[, 11])
    answer <- sort(best_hospitals(outcome_state, 11))[1]
  } else if (outcome == "heart failure") {
    outcome_state[, 17] <- as.numeric(outcome_state[, 17])
    answer <- sort(best_hospitals(outcome_state, 17))[1]
  } else if (outcome == "pneumonia") {
    outcome_state[, 23] <- as.numeric(outcome_state[, 23])
    answer <- sort(best_hospitals(outcome_state, 23))[1]
  }
  answer
}
