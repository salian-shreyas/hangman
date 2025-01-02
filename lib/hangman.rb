# Puzzle word should be of 5 to 12 characters
def random_puzzle_word
  file_lines = []
  File.foreach("1000-english.txt") do |line|
    line = line.chomp
    file_lines << line if line.length.between?(5, 12)
  end

  file_lines.sample
end

def get_player_input
  puts "Please enter an alphabet:"
  input = gets.chomp.upcase
  validate_and_return input
end

def validate_and_return(input)
  return get_player_input unless an_alphabet?(input)
  return input
end

def an_alphabet?(input)
  input.length == 1 && input.between?("A", "Z")
end

puzzle_word = random_puzzle_word
p puzzle_word

player_input = get_player_input
p player_input