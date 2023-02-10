# frozen_string_literal: true

require 'most_common_word_sequences_of_file'

describe MostCommonWordSequencesOfFile do
  let!(:file_name) { 'spec/empty.txt' }
  let(:file) { File.open(file_name) }

  describe 'call' do
    subject do
      described_class.new(file).call
    end
    context 'txt file is empty' do
      it 'returns an empty hash' do
        expect(subject).to eq({})
      end
    end
    context 'txt file has data' do
      let!(:file_name) { 'spec/full_of_.txt' }
      it 'returns a string' do
        expect(subject).to be_a_kind_of(Hash)
        expect(subject.length).to be <= MostCommonWordSequencesOfFile::NUM_OF_SEQUENCES
      end
    end
  end
end
