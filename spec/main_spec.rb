# frozen_string_literal: true

require 'main'

describe Main do
  let!(:file_names) { [] }

  describe 'call' do
    subject do
      described_class.new(file_names).call
    end

    context 'the user does not list files' do
      it 'return a help command' do
        expect(subject).to eq([])
      end
    end
    context 'one of the files is not a txt file' do
      let!(:file_names) { ['spec/empty.jpeg', 'spec/full_of_.txt'] }
      it 'expect to skip over non-.txt file' do
        expect(subject).to eq([
                                {
                                  'being silenced time' => 1,
                                  'first time being' => 1,
                                  'is not the' => 1,
                                  'not the onion’s' => 1,
                                  'onion’s first time' => 1,
                                  'sadly this is' => 1,
                                  'silenced time being' => 1,
                                  'the onion’s first' => 1,
                                  'this is not' => 1,
                                  'time being silenced' => 2
                                }
                              ])
      end
    end
    context 'one of the files does not exist' do
      let!(:file_names) { ['snidjcfkds.txt'] }
      it 'continues the program despite the invalid txt file' do
        expect(subject).to eq([])
      end
    end
    context 'all the txt files are valid' do
      let!(:file_names) { ['spec/empty.txt', 'spec/full_of_.txt'] }
      it 'prints the MostCommonWordSequencesOfFile of all files' do
        expect(subject).to eq([{},
                               {
                                 'being silenced time' => 1,
                                 'first time being' => 1,
                                 'is not the' => 1,
                                 'not the onion’s' => 1,
                                 'onion’s first time' => 1,
                                 'sadly this is' => 1,
                                 'silenced time being' => 1,
                                 'the onion’s first' => 1,
                                 'this is not' => 1,
                                 'time being silenced' => 2
                               }])
      end
    end
  end
end
