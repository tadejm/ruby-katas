require "set"

# Public: Dictionary is a set of words generated from provided (required)
# text file.

class Dictionary
  attr_reader :words

  def initialize dictionary_path
    @words = prepare dictionary_path
  end

  private

  def prepare dictionary
    words = Set.new
    File.open(dictionary) do |file|
      file.each do |line|
        line.chomp!
        words << line.downcase if (2..6).include?(line.size)
      end
    end
    words.to_a
  end
end
