class Player
  attr_reader :guesses

  def initialize
    @guesses = []
  end

  def new_guess
    input = get_input
    self.guesses << validate_input(input)
    self.guesses.last
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