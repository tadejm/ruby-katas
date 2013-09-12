require_relative "../../lib/word_finder"

describe WordFinder do
  subject { described_class.new dictionary }
  let(:dictionary) { %w(tailor jig saw jigsaw al bum apple tail or) }

  before do
    allow(dictionary).to receive(:words).and_return dictionary
    allow(Dictionary).to receive(:new).and_return dictionary
  end

  describe ".new" do
    it "initializes a Word Generator instance with a dictionary" do
      expect(subject.dictionary).to eq dictionary
    end
  end

  describe "#split" do
    it "splits the words into arrays of 2, 3, 4 and 6 letter words" do
      two = %w(al or)
      three = %w(jig saw bum)
      four = %w(tail)

      split_dictionary = [two, three, four]

      expect(subject.send(:split)).to eq(split_dictionary)
    end
  end

  describe "#find" do
    before { subject.find }

    it "generates all 6 letter words" do
      result = %w(tailor jigsaw)

      expect(subject.result).to eq(result)
    end
  end
end
