class Puzzle
  attr_reader :puzzle_word

  def initialize
    @puzzle_word = nil
  end

  def new_puzzle
    self.puzzle_word = random_puzzle_word.upcase 
  end

  private

  # Puzzle word should be of 5 to 12 characters
  def random_puzzle_word
    file_lines = []
    File.foreach("1000-english.txt") do |line|
      line = line.chomp
      file_lines << line if line.length.between?(5, 12)
    end

    file_lines.sample
  end

  attr_writer :puzzle_word
end