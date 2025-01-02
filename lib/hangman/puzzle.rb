class Puzzle
  attr_reader :puzzle

  def initialize
    @puzzle = nil
  end

  def new_puzzle
    self.puzzle = random_puzzle_word 
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

  attr_writer :puzzle
end