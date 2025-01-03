require_relative "display"

class Game
  include Display

  DEFAULT_ATTEMPTS = 7

  attr_reader  :correct_guess, :incorrect_guess
  attr_reader :player, :puzzle

  def initialize
    @attempts = DEFAULT_ATTEMPTS
    @correct_guess = []
    @incorrect_guess = []
    @player = Player.new
    @puzzle = Puzzle.new
  end

  def play
    self.puzzle.new_puzzle
    display_new_round
    player_turn
  end

  private

  def attempts
    @attempts - self.incorrect_guess.length
  end

  def attempts_left?
    attempts > 0
  end

  def correct_guess?(guess)
    self.puzzle.puzzle.include? guess
  end

  def handle(guess)
    if correct_guess?(guess)
      self.correct_guess << guess
    else
      self.incorrect_guess << guess
    end
  end

  def display_new_round
    Display.new_round(
      self.puzzle.puzzle,
      self.correct_guess,
      self.incorrect_guess,
      self.attempts
    )
  end

  def player_turn
    while attempts_left?
      handle self.player.new_guess
      display_new_round
    end
  end
end