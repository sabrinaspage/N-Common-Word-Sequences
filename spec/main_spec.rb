require 'main'

describe Main do
  let!(:file_names) {[]}

  describe "call" do
    subject {
      described_class.new(file_names).call
    }

    context "the user does not list files" do
      it "return a help command" do
        expect(subject).to eq([])
      end
    end
    context "one of the files is not a txt file" do
      let!(:file_names) {['spec/empty.jpeg', 'spec/full_of_.txt']}
      it "expect to skip over non-.txt file" do
        expect(subject).to eq([nil])
      end
    end
    context "one of the files does not exist" do
      let!(:file_names) {['snidjcfkds.txt']}
      it "continues the program despite the invalid txt file" do
        expect(subject).to eq([])
      end
    end
    context "all the txt files are valid" do
      let!(:file_names) {['spec/empty.txt', 'spec/full_of_.txt']}
      it "prints the MostCommonWordSequencesOfFile of all files" do
        expect(subject).to eq([nil, nil])
      end
    end
  end
end