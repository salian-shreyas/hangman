# hangman

Hangman is a classic word-guessing game, it's often used for fun or as an educational tool to help with vocabulary and spelling. 

The project is to build a command line Hangman game where one player plays against the computer.

## How to play

Clone the repository and run command
<code>bundle exec ruby lib/hangman.rb</code>

Start the game by entering the guess letter one at a time.
If the guessed letter is in the **word**, it is filled in **all the correct positions**.
If the guessed letter is not in the word, one attempt will be deducted.
The guesser wins if they guess the full word before no attempts left.
 