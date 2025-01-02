require_relative "hangman/player"
require_relative "hangman/puzzle"

puzzle = Puzzle.new
player = Player.new

p puzzle.new_puzzle
p player.new_guess