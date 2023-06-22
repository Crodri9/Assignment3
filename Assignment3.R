# Assignment 3 - Hangman

#' Project plan
#' Create dictionary of words and save as txt file in working directory
#' Choose random words from dictionary each round
#' Prompt user to enter character
#' Use defensive coding to ensure (1)it is a character (2) they've only entered 1 character (3) accept both upper/ lower case
#' Tell user if input was correct
#' If correct - visually demonstrate where in the word does the correct letter go

## Set up values prior to coding the game
# Upload dictionary to working directory 


dictionary <- readLines("dictionary.txt")

# Ensure that the secret word is randomly selected from the dictionary of words
secret_word <- sample(dictionary, 1)

# Identify how many characters are in the word so user can be informed about the word length
characters <- nchar(secret_word)
print("You can do this! Enter a letter one by one and guess the secret word!")
print(paste("The secret word has", characters, "characters"))
print("You have 5 tries.")

# Provide user instructions and information about word/ number of guesses allowed
guessed_letters <- vector("character", nchar(secret_word))
guessed_letters[] <- "_"
tries <- 0
max_tries <- 5


while ("_" %in% guessed_letters) {
  cat("Secret word: ", paste(guessed_letters, collapse = " "), "\n")
  answer <- readline("Please guess a letter: ")
  
  if (nchar(answer) != 1) {
    cat("Uh oh! Please enter a single letter. ")
    next
  }
  
  
  if (!grepl("[A-Za-z]", answer)) {
    cat("Oops, invalid input. Enter a letter! ")
    next
  }
  
  if (answer %in% guessed_letters) {
    cat("Oh no! You've already guessed that letter. Try another! ")
    next
  }
  
  if (answer %in% strsplit(secret_word, "")[[1]]) {
    cat("Woah! Correct guess!\n")
    matching_indices <- which(strsplit(secret_word, "")[[1]] == answer)
    guessed_letters[matching_indices] <- answer
  } else {
    cat("Incorrect guess. Try again! ")
    tries <- tries + 1
    
    
    remaining_tries <- max_tries - tries
    if (remaining_tries > 0) {
      cat("Remaining tries:", remaining_tries, "\n")
    } else {
      cat("Nice try! Unforunately you've run out of guesses. The secret word was: ", secret_word, "\n")
      break
    }
  }
}

if (!("_" %in% guessed_letters)) {
  cat("Amazing! You've guessed the secret word:", secret_word, "\n")
}  
  