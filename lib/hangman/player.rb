class Player
  attr_accessor :guesses

  def initialize
    @guesses = []
  end

  def new_guess
    input = get_input
    return input if input == "SAVE"
    self.guesses << validate_input(input)
    self.guesses.last
  end

  def play_saved_game?
    puts "Do you wish to continue playing previously saved game?"
    puts "Enter 'y' for yes: "
    input = gets.chomp.downcase
    input == 'y'
  end

  private

  def get_input
    puts "Please enter an alphabet:"
    gets.strip.upcase
  end

  def validate_input(input)
    return new_guess unless an_alphabet?(input)
    if repeated?(input)
      puts "Repeated alphabet: #{input}"
      return new_guess
    end
    return input
  end

  def an_alphabet?(input)
    input.length == 1 && input.between?("A", "Z")
  end

  def repeated?(input)
    self.guesses.include? input
  end
end