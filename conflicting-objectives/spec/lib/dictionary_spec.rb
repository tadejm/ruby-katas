require_relative "../../lib/dictionary"

describe Dictionary do
  subject { described_class.new path_to_dictionary }
  let(:path_to_dictionary) { File.expand_path "dictionary.txt" }

  describe ".new" do
    let(:valid_word) { "zebra" }

    it "dictionary contains valid words" do
      expect(subject.words).to include valid_word
    end

    it "words are lowercased" do
      upcased_word = valid_word.upcase

      expect(subject.words).to include valid_word
      expect(subject.words).not_to include upcased_word
    end

    it "words are without whitespaces" do
      word_with_whitespaces = " zebra "

      expect(subject.words).not_to include word_with_whitespaces
    end

    it "words are shorter 7 and greater than 1 letter" do
      word_too_short, word_too_long = "a", "helicopter"

      expect(subject.words).not_to include word_too_short
      expect(subject.words).not_to include word_too_long
    end

    it "words do not repeat" do
      expect(subject.words.size).to eq(subject.words.uniq.size)
    end

    context "when dictionary file doesn't exist" do
      it "throws an exception" do
        invalid_path = "/s/s/d/a.txt"
        expect{ described_class.new(invalid_path) }.to raise_error
      end

    end
  end
end
