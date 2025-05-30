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
    new_game
    display_new_round
    player_turn
    display_conclusion
  end

  private

  attr_writer :correct_guess, :incorrect_guess

  def attempts
    @attempts - self.incorrect_guess.length
  end

  def attempts_left?
    attempts > 0
  end

  def game_won?
    puzzle = self.puzzle.puzzle_word.split("")
    puzzle.all? {|char| self.correct_guess.include? char}
  end

  def playable?
    attempts_left? && !game_won?
  end

  def correct_guess?(guess)
    self.puzzle.puzzle_word.include? guess
  end

  def handle_guess(guess)
    if correct_guess?(guess)
      self.correct_guess << guess
    else
      self.incorrect_guess << guess
    end
  end

  def display_new_round
    Display.new_round(
      self.puzzle.puzzle_word,
      self.correct_guess,
      self.incorrect_guess,
      self.attempts
    )
  end

  def player_turn
    while playable?
      handle_input self.player.new_guess
      display_new_round
    end
  end

  def display_conclusion
    if game_won?
      Display.won
    else
      Display.lost(self.puzzle.puzzle_word)
    end
  end

  def save_game
    game_file = File.new("./game_file.json", "w")
    game_file.puts JSON.dump({
      puzzle_word: self.puzzle.puzzle_word,
      correct_guess: self.correct_guess,
      incorrect_guess: self.incorrect_guess
    })
    game_file.close
  end

  def handle_input(input)
    if input == "SAVE"
      save_game
      Display.save_game
      exit
    else
      handle_guess(input)
    end
  end

  def play_saved_game?
    File.exist?("game_file.json") && player_agree?
  end

  def player_agree?
    self.player.play_saved_game?
  end

  def new_game
    if play_saved_game?
      load_saved_game
    else
      self.puzzle.new_puzzle 
    end
  end

  def update_game_data(game_data)
    self.puzzle.puzzle_word = game_data['puzzle_word']
    self.correct_guess = game_data['correct_guess']
    self.incorrect_guess = game_data['incorrect_guess']
    self.player.guesses = self.correct_guess << self.incorrect_guess
  end

  def load_saved_game
    game_file = File.new("game_file.json", "r")
    game_data = JSON.parse game_file.read.strip 
    update_game_data game_data
  end
end