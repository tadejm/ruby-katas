require "dictionary"

# Public: WordFinder class presents the interface for perfoming generated words lookup.

class WordFinder
  attr_reader :dictionary, :result, :full_words


  def initialize dictionary
    @dictionary = Dictionary.new dictionary
    @result, @full_words = [], []
  end

  def find
    generate.map do |phase|
      word = phase.join('')
      if full_words.include?(word)
        puts "#{phase.first} + #{phase.last} = #{word}"
        result << word
      end
    end
    puts "Found #{result.size} words."
    result
  end

  private

  def generate
    two, three, four = split
    (two.product(four) | four.product(two) | three.product(three))
  end

  def split
    two, three, four = [], [], []

    for word in dictionary.words
      case word.size
      when 2 then two << word
      when 3 then three << word
      when 4 then four << word
      when 6 then @full_words << word
      end
    end
    return [two, three, four]
  end
end
