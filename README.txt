# Submitted By - 
#     Name         - Rohan Khanna
#     Entry Number - 2020CSB1117
#     Dated        - Feb '19 2022   
#     Indian Institute of Technology Ropar
#     CS202 Course
#     Hangman in Perl Lab 4

// HOW TO RUN GAME ?
    To make it easy for TAs, I displayed the correct word at starting, so one can see expected results.
    Hangman is dislpayed using 6 different functions, which are run on the basis of number of guesses left.
    User is given an insight of word with dashes and is aked to input a possible letter.
    
    ****** ****** ******  INPUT FORMAT ***** ****** ****** *** 
    NOTE that LETTER IS NOT CASE-SENSITIVE !!!
    Also, if you enter a special character, It will count as bad guess.
    Also, if you enter a group of letters (a word), then it will show error, as you can enter only single letteer (alphabet).
    Don't enter any kind of space as it will show error and ask you to input again.
    
    It detects if user already guessed it, If yes, then it again asks user to give input.
    All above cases are considered, and program will ask you to re-enter in case of invalid letter input or already guessed letter.
   
    Next, it checks if correct Word has that particular letter.
    Next it tells whether your guess is right or not ?
    If yes, your number of guesses left and hangman display remains same
    Else Number of guesses reduce by 1 and hangman comes to next stage.
    Input is taken until you complete your wordStatus or your number of guesses left becomes 0.

    At last, user asks if you want to play again.
    Enter y or n only, If entered anything else, it will again ask you.  

// VARIABLES DEFINITION 
    1. @sampleList // Array of words which can be asked to guessed (selected randomly)
    2. @guessesLeft // Number of guesses left // Initially set to 6
    3. @myGuesses // The words which I guess keeps on adding here
    4. @completed // Keeps track of whether user completed the guessing
    5. $correctWord // Random word selected for guessing
    6. @wordStatus // Stores all correct guesses at correct positions


// WHY USE OF DIFFERENT SUB-ROUTINES :  
    1. &main() : For creating an interactive menu, Program starts from here.
    2. &displayHangman() : Displays hangman on the basis of number of guesses left
    3. &guessMaker() : Takes input of letter guessed and also checks for invalid inputs
    4. &resetGameInput() : As soon as a game session ends, it is for asking user to restart game
    5. &checkWin : checks at any point word guess is completed by user, and sets $completed = 1 , in win condition
    6. &checkStatus : This is to check if guessed word is right or wrong

        (NOTE THAT : guessMaker doesn;t check for correctness of guessedLetter)

// Other syntax descriptions are given in code ("Hangman.pl") as comments 

