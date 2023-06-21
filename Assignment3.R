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
print(paste("The secret word has", characters, "characters"))
print("You have 5 tries to guess the secret word")

# Provide user instructions and information about word/ number of guesses allowed
guessed_letters <- c()
wrong <- 0 

#Set max number of incorrect guesses allowed before game ends
max_wrong <- 5
