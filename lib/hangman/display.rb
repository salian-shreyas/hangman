module Display
  def self.attempts_left(attempts)
    puts "\nAttempts left: #{attempts}"
  end

  def self.correct_guess(correct_guess, puzzle)
    print "\n"
    puzzle.split("").each do |char|
      if correct_guess.include?(char)
        print " " << char << " "
      else
        print " _ "
      end
    end
    print "\n"
  end

  def self.incorrect_guess(incorrect_guess)
    return if incorrect_guess.length == 0
    puts "Incorrect guesses: #{incorrect_guess.join(", ")}"
  end

  def self.new_round(puzzle, correct_guess, incorrect_guess, attempts)
    self.correct_guess(correct_guess, puzzle)
    self.incorrect_guess(incorrect_guess)
    self.attempts_left(attempts)
  end
end