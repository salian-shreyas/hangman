# Puzzle word should be of 5 to 12 characters
def random_puzzle_word
  file_lines = []
  File.foreach("1000-english.txt") do |line|
    line = line.chomp
    file_lines << line if line.length.between?(5, 12)
  end

  file_lines.sample
end

puzzle_word = random_puzzle_word
p puzzle_word