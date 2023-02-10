require 'most_common_word_sequences_of_file'

describe 'MostCommonWordSequencesOfFile' do
  describe "call" do
    it "returns hash which meets challenge criteria" do

    end
  end
  describe "strip" do
    it "strips the data" do

    end
  end
  describe "sequence_has_empty_strings" do
    let!(:data) {}
    let!(:index) {}
    let(:sequence_has_empty_strings) { MostCommonWordSequencesOfFile.new('blah.jpg').sequence_has_empty_strings(data, index) }
    context "has empty strings starting at index 0" do
      let!(:data) { ['', 'b', 'e', 'g'] }
      let!(:index) { 0 }
      it "returns true" do
        expect(sequence_has_empty_strings).to eq(true)
      end
    end
    context "has empty strings starting at index 1" do
      let!(:data) { ['', 'b', 'e', 'g'] }
      let!(:index) { 1 }
      it "returns false" do
        expect(sequence_has_empty_strings).to eq(false)
      end
    end
    context "does not have empty strings" do
      let!(:data) { ['pl', 'b', 'e', 'g', 'e'] }
      let!(:index) { 2 }
      it "returns false" do
        expect(sequence_has_empty_strings).to eq(false)
      end
    end
  end
  describe "word_seq" do
    let!(:data) {}
    let!(:index) {}
    let(:word_seq) { MostCommonWordSequencesOfFile.new('blah.jpg').word_seq(data, index) }
    context "array has only empty strings" do
      let!(:data) { ['', '', ''] }
      let!(:index) { 0 }
      it "returns empty string" do
        expect(word_seq).to eq("  ")
      end
    end
    context "array has one empty string" do
      let!(:data) { ['', 'a', 'b'] }
      let!(:index) { 0 }
      it "returns string with all non-empty strings" do
        expect(word_seq).to eq(" a b")
      end
    end
    context "array of has non-empty strings" do
      let!(:data) { ['a', 'b', 'd', 'e'] }
      let!(:index) { 1 }
      it "returns string with #{MostCommonWordSequencesOfFile::NUM_OF_WORDS_IN_SEQUENCE} strings starting at index 1}" do
        expect(word_seq).to eq("b d e")
      end
    end
    context "index is near end of array" do
      let!(:data) { ['a', 'b', 'd', 'e'] }
      let!(:index) { 3 }
      it "returns string with #{MostCommonWordSequencesOfFile::NUM_OF_WORDS_IN_SEQUENCE} strings starting at index 3" do
        expect(word_seq).to eq("e")
      end
    end

  end
  describe "word_sequence_frequencies" do
    it "returns the correct frequencies based on the input" do

    end
  end
  describe "descend" do
    let(:descent) { MostCommonWordSequencesOfFile.new('blah.jpg').descend({:h => 3, :p => 10, :k => 1, :q => 6}) }
    it "descends the hash by value" do
      expect(descent).to eq([[:p, 10], [:q, 6], [:h, 3], [:k, 1]])
    end
  end
  describe "top_common_word_sequences" do
    hash = {}
    100.times {|n| hash[n]=rand(101)}
    let(:top) { MostCommonWordSequencesOfFile.new('blah.jpg').top_common_word_sequences( hash ) }
    it "returns the top #{MostCommonWordSequencesOfFile::NUM_OF_SEQUENCES} values in the hash" do
      expect(top.length).to eq(100)
    end
  end
end