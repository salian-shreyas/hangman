class Player
  attr_reader :guesses

  def initialize
    @guesses = []
  end

  def new_guess
    input = get_input
    self.guesses << validate_input(input)
  end

  private

  def get_input
    puts "Please enter an alphabet:"
    gets.chomp.upcase
  end

  def validate_input(input)
    return get_player_input unless an_alphabet?(input)
    return input
  end

  def an_alphabet?(input)
    input.length == 1 && input.between?("A", "Z")
  end

  attr_writer :guesser
end