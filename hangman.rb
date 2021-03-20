def random_word
  word = File.read("../scrabble word cheat/words.txt").split("\n").sample
  if word.length > 6
    random_word
  end
  word
end

def underscore_word(word, guessed)
  word.chars.map { |l| guessed.include?(l) ? l : "_"}.join
end


def hang_man_game
  word = random_word
  word_length = word.length
  correct_guesses = 0
  incorrect_guesses = 0
  letters_guessed = []
  guessed_letter = ""
  loop do
    puts "The word is #{underscore_word(word, letters_guessed)}"
    if underscore_word(word, letters_guessed) == word
      puts "You won"
      break
    elsif incorrect_guesses > 8
      puts "The word was #{word}"
      puts "You lost"
      break
    end
    puts "Incorrect guesses left: #{8 - incorrect_guesses}"
    puts "Letters guessed: #{letters_guessed.join(", ")}"
    puts "Guess a letter: "
    guessed_letter = gets.chomp!
    if letters_guessed.include?(guessed_letter)
      puts "You've already guessed that letter try a new one"
      next
    elsif word.chars.include?(guessed_letter)
      letters_guessed << guessed_letter
      correct_guesses += 1
      p correct_guesses
    else
      letters_guessed << guessed_letter
      incorrect_guesses += 1
    end
  end
end

hang_man_game

# display the length of the word to the user
# correct_guesses is less than the length of the word
# prompt the user to guess a letter
# if the guess is correct increment correct_guesses by 1
# if the guess is incorrect increment incorrect_guesses by 1
# and draw the next part of the hangman
# if the incorrect_guesses is greater than 8, tell the user
# they lost and exit the program
# if correct_guesses is equal to the length of the word, tell the user they won (edited)

