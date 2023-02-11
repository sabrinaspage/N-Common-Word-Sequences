# frozen_string_literal: true

require 'most_common_word_sequences_of_file'

describe MostCommonWordSequencesOfFile do
  let!(:file_name) { 'spec/empty.txt' }
  let(:file) { File.open(file_name) }
  let(:output) do
    {
      "time being silenced"=>3,
      "sadly this is"=>2,
      "this is not"=>2,
      "is not sadly"=>1,
      "not sadly this"=>1,
      "is not the"=>1,
      "not the onion’s"=>1,
      "the onion’s first"=>1,
      "onion’s first time"=>1,
      "first time being"=>1,
      "being silenced time"=>1,
      "silenced time being"=>1,
      "being silenced sadly"=>1,
      "silenced sadly this"=>1,
      "this is this"=>1,
      "is this is"=>1
    }
  end

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
        expect(subject.length).to be <= MostCommonWordSequencesOfFile::NUM_OF_SEQUENCES
        expect(subject).to eq(output)
      end
    end
  end
end
