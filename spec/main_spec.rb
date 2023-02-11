# frozen_string_literal: true

require 'main'

describe Main do
  let!(:file_names) { [] }
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
      described_class.new(file_names).call
    end

    context 'the user does not list files' do
      it 'returns an empty array' do
        expect(subject).to eq([])
      end
    end
    context 'one of the files is not a txt file' do
      let!(:file_names) { ['spec/empty.jpeg', 'spec/full_of_.txt'] }
      it 'expect to skip over non-.txt file' do
        expect(subject).to eq([output])
      end
    end
    context 'one of the files does not exist' do
      let!(:file_names) { ['snidjcfkds.txt'] }
      it 'returns an empty array' do
        expect(subject).to eq([])
      end
    end
    context 'all the txt files are valid' do
      let!(:file_names) { ['spec/empty.txt', 'spec/full_of_.txt'] }
      it 'prints the MostCommonWordSequencesOfFile of all files' do
        expect(subject).to eq([{}, output])
      end
    end
  end
end
